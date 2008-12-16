/* 
 * Interface for the configuration implementations.
 *
 * Copyright (C) 2008 Mark Lee <libdesktop-agnostic@lazymalevolence.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 *
 * Author : Mark Lee <libdesktop-agnostic@lazymalevolence.com>
 */

using DesktopAgnostic;
using GLib;

namespace DesktopAgnostic.Config
{
  public errordomain ConfigError
  {
    INVALID_TYPE,
    KEY_NOT_FOUND
  }
  public const string GROUP_DEFAULT = "DEFAULT";
  public struct NotifyEntry
  {
    public string group;
    public string key;
    public Value value;
  }
  public delegate void NotifyFunc (NotifyEntry entry);
  public abstract class Backend : Object
  {
    public abstract string name { get; }
    protected Schema _schema;
    public Schema schema
    {
      get
      {
        return this._schema;
      }
    }
    // This is how the constructor should look.
    public Backend (string schema_filename)
    {
      GLib.message ("Backend constructor.");
      this._schema = new Schema (schema_filename);
    }
    public abstract void reset () throws Error;
    public abstract void notify_add (string group, string key, NotifyFunc callback);
    public abstract void notify (string group, string key);
    public abstract void notify_remove (string group, string key, NotifyFunc callback) throws Error;
    public abstract void load_defaults_from_schema () throws Error;
    public abstract Value get_value (string group, string key) throws Error;
    public void
    set_value (string group, string key, Value value) throws Error
    {
      SchemaOption option = this._schema.get_option (group, key);
      if (option == null)
      {
        throw new ConfigError.KEY_NOT_FOUND ("Could not find group and/or key in schema.");
      }
      switch (option.option_type)
      {
        case typeof (bool):
          this.set_bool (group, key, value.get_boolean ());
          break;
        case typeof (float):
          this.set_float (group, key, value.get_float ());
          break;
        case typeof (int):
          this.set_int (group, key, value.get_int ());
          break;
        case typeof (string):
          this.set_string (group, key, value.get_string ());
          break;
        default:
          // special case because typeof (ValueArray) is not constant in C.
          if (option.option_type == typeof (ValueArray))
          {
            this.set_list (group, key, (ValueArray)value.get_boxed ());
          }
          else
          {
            SchemaType st = this.schema.find_type (option.option_type);
            if (st == null)
            {
              throw new ConfigError.INVALID_TYPE ("Invalid config value type.");
            }
            else
            {
              this.set_string (group, key, st.serialize (value));
            }
          }
          break;
      }
    }
    public abstract bool get_bool (string group, string key) throws Error;
    public abstract void set_bool (string group, string key, bool value) throws Error;
    public abstract float get_float (string group, string key) throws Error;
    public abstract void set_float (string group, string key, float value) throws Error;
    public abstract int get_int (string group, string key) throws Error;
    public abstract void set_int (string group, string key, int value) throws Error;
    public abstract string get_string (string group, string key) throws Error;
    public abstract void set_string (string group, string key, string value) throws Error;
    public abstract ValueArray get_list (string group, string key) throws Error;
    public abstract void set_list (string group, string key, ValueArray value) throws Error;
  }
}

// vim: set et ts=2 sts=2 sw=2 ai :