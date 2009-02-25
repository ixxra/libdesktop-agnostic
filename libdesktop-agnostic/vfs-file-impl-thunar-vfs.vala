/* 
 * Desktop Agnostic Library: File implementation (with Thunar VFS).
 *
 * Copyright (C) 2009 Mark Lee <libdesktop-agnostic@lazymalevolence.com>
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

namespace DesktopAgnostic.VFS.File
{
  public class ThunarVFSBackend : Backend
  {
    private ThunarVfs.Path _path;
    private ThunarVfs.Info _info;
    public override void* implementation
    {
      get
      {
        return (void*)this._path;
      }
    }
    private string _uri;
    protected override string? impl_path
    {
      owned get
      {
        return this._path.dup_string ();
      }
    }
    protected override string impl_uri
    {
      get
      {
        return this._uri;
      }
    }
    public override bool exists
    {
      get
      {
        return FileUtils.test (this.path, FileTest.EXISTS);
      }
    }
    public override FileType file_type
    {
      get
      {
        FileType ft;
        if (this._info == null)
        {
          ft = FileType.UNKNOWN;
        }
        else
        {
          if ((this._info.flags & ThunarVfs.FileFlags.SYMLINK) != 0)
          {
            ft = FileType.SYMBOLIC_LINK;
          }
          else
          {
            switch (this._info.type)
            {
              case ThunarVfs.FileType.REGULAR:
                ft = FileType.REGULAR;
                break;
              case ThunarVfs.FileType.DIRECTORY:
                ft = FileType.DIRECTORY;
                break;
              case ThunarVfs.FileType.SYMLINK:
                ft = FileType.SYMBOLIC_LINK;
                break;
              case ThunarVfs.FileType.PORT:
              case ThunarVfs.FileType.DOOR:
              case ThunarVfs.FileType.SOCKET:
              case ThunarVfs.FileType.BLOCKDEV:
              case ThunarVfs.FileType.CHARDEV:
              case ThunarVfs.FileType.FIFO:
                ft = FileType.SPECIAL;
                break;
              case ThunarVfs.FileType.UNKNOWN:
                ft = FileType.UNKNOWN;
                break;
            }
          }
        }
        return ft;
      }
    }
    protected override void
    init (string uri)
    {
      this._uri = uri;
      try
      {
        this._path = new ThunarVfs.Path (this._uri);
        try
        {
          this._info = new ThunarVfs.Info.for_path (this._path);
        }
        catch (GLib.FileError err)
        {
          this._info = null;
        }
      }
      catch (Error err)
      {
        critical (err.message);
      }
    }
    public override Monitor monitor ()
    {
      return new ThunarVFSMonitor (this);
    }
  }
}

// vim: set et ts=2 sts=2 sw=2 ai :