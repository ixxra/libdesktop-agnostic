#! /usr/bin/env python
# encoding: utf-8

import os,sys,imp,types,ccroot
import optparse
import Utils,Configure,Options
from Logs import debug
c_compiler={'win32':['msvc','gcc'],'cygwin':['gcc'],'darwin':['gcc'],'aix5':['gcc'],'linux':['gcc','icc','suncc'],'sunos':['gcc','suncc'],'irix':['gcc'],'hpux':['gcc'],'default':['gcc']}
def __list_possible_compiler(platform):
	try:
		return c_compiler[platform]
	except KeyError:
		return c_compiler["default"]
def detect(conf):
	try:test_for_compiler=Options.options.check_c_compiler
	except AttributeError:conf.fatal("Add set_options(opt): opt.tool_options('compiler_cc')")
	for compiler in test_for_compiler.split():
		try:
			conf.check_tool(compiler)
		except Configure.ConfigurationError,e:
			debug('compiler_cc: %r'%e)
		else:
			if conf.env['CC']:
				conf.check_message(compiler,'',True)
				conf.env['COMPILER_CC']=compiler
				break
			conf.check_message(compiler,'',False)
def set_options(opt):
	detected_platform=Options.platform
	possible_compiler_list=__list_possible_compiler(detected_platform)
	test_for_compiler=str(" ").join(possible_compiler_list)
	cc_compiler_opts=opt.add_option_group("C Compiler Options")
	cc_compiler_opts.add_option('--check-c-compiler',default="%s"%test_for_compiler,help='On this platform (%s) the following C-Compiler will be checked by default: "%s"'%(detected_platform,test_for_compiler),dest="check_c_compiler")
	for c_compiler in test_for_compiler.split():
		opt.tool_options('%s'%c_compiler,option_group=cc_compiler_opts)

