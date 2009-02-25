/* thunar-vfs-1.vapi generated by vapigen, do not modify. */

[CCode (cprefix = "ThunarVfs", lower_case_cprefix = "thunar_vfs_")]
namespace ThunarVfs {
	[CCode (cprefix = "THUNAR_VFS_FILE_TYPE_", cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public enum FileType {
		PORT,
		DOOR,
		SOCKET,
		SYMLINK,
		REGULAR,
		BLOCKDEV,
		DIRECTORY,
		CHARDEV,
		FIFO,
		UNKNOWN
	}
	[CCode (cprefix = "THUNAR_VFS_INFO_METADATA_", has_type_id = "0", cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public enum InfoMetadata {
		FILE_LINK_TARGET,
		TRASH_ORIGINAL_PATH,
		TRASH_DELETION_DATE
	}
	[CCode (cprefix = "THUNAR_VFS_INTERACTIVE_JOB_RESPONSE_", has_type_id = "0", cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public enum InteractiveJobResponse {
		YES,
		YES_ALL,
		NO,
		CANCEL
	}
	[CCode (cprefix = "THUNAR_VFS_MONITOR_EVENT_", cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public enum MonitorEvent {
		CHANGED,
		CREATED,
		DELETED
	}
	[CCode (cprefix = "THUNAR_VFS_PATH_SCHEME_", has_type_id = "0", cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public enum PathScheme {
		FILE,
		TRASH,
		MASK
	}
	[CCode (cprefix = "THUNAR_VFS_THUMB_SIZE_", cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public enum ThumbSize {
		NORMAL,
		LARGE
	}
	[CCode (cprefix = "THUNAR_VFS_VOLUME_KIND_", cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public enum VolumeKind {
		UNKNOWN,
		CDROM,
		CDR,
		CDRW,
		DVDROM,
		DVDRAM,
		DVDR,
		DVDRW,
		DVDPLUSR,
		DVDPLUSRW,
		FLOPPY,
		HARDDISK,
		USBSTICK,
		AUDIO_PLAYER,
		AUDIO_CD,
		MEMORY_CARD,
		REMOVABLE_DISK
	}
	[CCode (cprefix = "THUNAR_VFS_DEEP_COUNT_FLAGS_", cheader_filename = "thunar-vfs/thunar-vfs.h")]
	[Flags]
	public enum DeepCountFlags {
		NONE,
		FOLLOW_SYMLINKS
	}
	[CCode (cprefix = "THUNAR_VFS_FILE_FLAGS_", cheader_filename = "thunar-vfs/thunar-vfs.h")]
	[Flags]
	public enum FileFlags {
		NONE,
		SYMLINK,
		EXECUTABLE,
		HIDDEN,
		READABLE,
		WRITABLE
	}
	[CCode (cprefix = "THUNAR_VFS_FILE_MODE_", cheader_filename = "thunar-vfs/thunar-vfs.h")]
	[Flags]
	public enum FileMode {
		SUID,
		SGID,
		STICKY,
		USR_ALL,
		USR_READ,
		USR_WRITE,
		USR_EXEC,
		GRP_ALL,
		GRP_READ,
		GRP_WRITE,
		GRP_EXEC,
		OTH_ALL,
		OTH_READ,
		OTH_WRITE,
		OTH_EXEC
	}
	[CCode (cprefix = "THUNAR_VFS_JOB_RESPONSE_", cheader_filename = "thunar-vfs/thunar-vfs.h")]
	[Flags]
	public enum JobResponse {
		YES,
		YES_ALL,
		NO,
		CANCEL,
		NO_ALL,
		RETRY
	}
	[CCode (cprefix = "THUNAR_VFS_MIME_HANDLER_", cheader_filename = "thunar-vfs/thunar-vfs.h")]
	[Flags]
	public enum MimeHandlerFlags {
		HIDDEN,
		REQUIRES_TERMINAL,
		SUPPORTS_STARTUP_NOTIFY,
		SUPPORTS_MULTI,
		SUPPORTS_URIS
	}
	[CCode (cprefix = "THUNAR_VFS_VOLUME_STATUS_", cheader_filename = "thunar-vfs/thunar-vfs.h")]
	[Flags]
	public enum VolumeStatus {
		MOUNTED,
		PRESENT,
		MOUNTABLE
	}
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public class Job : GLib.Object {
		public Job ();
		public void cancel ();
		public bool cancelled ();
		public weak ThunarVfs.Job launch ();
		[NoWrapper]
		public virtual void execute ();
		[NoWrapper]
		public virtual void reserved1 ();
		[NoWrapper]
		public virtual void reserved2 ();
		public virtual signal void status_ready (uint64 total_size, uint file_count, uint directory_count, uint unreadable_directory_count);
		public virtual signal ThunarVfs.JobResponse ask (string message, ThunarVfs.JobResponse choices);
		public virtual signal ThunarVfs.JobResponse ask_replace (ThunarVfs.Info src_info, ThunarVfs.Info dst_info);
		public virtual signal void error (void* p0);
		public virtual signal void finished ();
		public virtual signal void info_message (string p0);
		public virtual signal bool infos_ready (void* p0);
		public virtual signal void new_files (void* p0);
		public virtual signal void percent (double p0);
	}
	[Compact]
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public class FileDevice {
	}
	[Compact]
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public class FileSize {
	}
	[Compact]
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public class FileTime {
	}
	[Compact]
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public class GroupId {
	}
	[Compact]
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public class MonitorHandle {
	}
	[Compact]
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public class UserId {
	}
	[Compact]
	[CCode (ref_function = "thunar_vfs_info_ref", unref_function = "thunar_vfs_info_unref", cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public class Info {
		public ThunarVfs.FileType type;
		public ThunarVfs.FileMode mode;
		public ThunarVfs.FileFlags flags;
		public weak ThunarVfs.UserId uid;
		public weak ThunarVfs.GroupId gid;
		public weak ThunarVfs.FileSize size;
		public weak ThunarVfs.FileTime atime;
		public weak ThunarVfs.FileTime mtime;
		public weak ThunarVfs.FileTime ctime;
		public weak ThunarVfs.FileDevice device;
		public weak ThunarVfs.MimeInfo mime_info;
		public weak ThunarVfs.Path path;
		public weak string custom_icon;
		public weak string display_name;
		public int ref_count;
		public weak ThunarVfs.Info copy ();
		public bool execute (Gdk.Screen screen, GLib.List path_list, string working_directory) throws GLib.Error;
		public weak string get_custom_icon ();
		public bool get_free_space (ThunarVfs.FileSize free_space_return);
		public weak string get_metadata (ThunarVfs.InfoMetadata metadata) throws GLib.Error;
		public static void list_free (GLib.List info_list);
		public bool matches (ThunarVfs.Info b);
		public Info.for_path (ThunarVfs.Path path) throws GLib.Error;
		public weak string read_link () throws GLib.Error;
		public bool rename (string name) throws GLib.Error;
		public bool set_custom_icon (string custom_icon) throws GLib.Error;
	}
	[Compact]
	[CCode (ref_function = "thunar_vfs_mime_info_ref", unref_function = "thunar_vfs_mime_info_unref", cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public class MimeInfo {
		public int ref_count;
		public weak string comment;
		public weak string icon_name;
		public static bool equal (void* a, void* b);
		public weak string get_comment ();
		public weak string get_media ();
		public weak string get_name ();
		public weak string get_subtype ();
		public static uint hash (void* info);
		public static void list_free (GLib.List info_list);
		public weak string lookup_icon_name (Gtk.IconTheme icon_theme);
		public MimeInfo (string name, long len);
	}
	[Compact]
	[CCode (ref_function = "thunar_vfs_path_ref", unref_function = "thunar_vfs_path_unref", cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public class Path {
		public int ref_count;
		public weak ThunarVfs.Path parent;
		public weak string dup_string ();
		public weak string dup_uri ();
		public static bool equal (void* path_ptr_a, void* path_ptr_b);
		public static weak ThunarVfs.Path get_for_home ();
		public static weak ThunarVfs.Path get_for_root ();
		public static weak ThunarVfs.Path get_for_trash ();
		public weak string get_name ();
		public weak ThunarVfs.Path get_parent ();
		public ThunarVfs.PathScheme get_scheme ();
		public static uint hash (void* path_ptr);
		public bool is_ancestor (ThunarVfs.Path ancestor);
		public bool is_home ();
		public bool is_root ();
		public Path (string identifier) throws GLib.Error;
		public weak ThunarVfs.Path relative (string name);
		public long to_string (string buffer, ulong bufsize) throws GLib.Error;
		public long to_uri (string buffer, ulong bufsize) throws GLib.Error;
	}
	[Compact]
	[CCode (copy_function = "thunar_vfs_path_list_copy", cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public class PathList {
		public static weak GLib.List append (GLib.List path_list, ThunarVfs.Path path);
		public static weak GLib.List copy (GLib.List path_list);
		public static weak GLib.List from_string (string uri_string) throws GLib.Error;
		public static weak GLib.List prepend (GLib.List path_list, ThunarVfs.Path path);
		public static weak string to_string (GLib.List path_list);
	}
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public class Group : GLib.Object {
		public weak ThunarVfs.GroupId get_id ();
		public weak string get_name ();
	}
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public class InteractiveJob : ThunarVfs.Job {
		public uint64 reserved0;
		[NoWrapper]
		public virtual void reserved1 ();
		[NoWrapper]
		public virtual void reserved2 ();
		[NoWrapper]
		public virtual void reserved3 ();
		[NoWrapper]
		public virtual void reserved4 ();
	}
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public class MimeAction : ThunarVfs.MimeHandler {
	}
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public class MimeApplication : ThunarVfs.MimeHandler {
		public static bool equal (void* a, void* b);
		public weak GLib.List get_actions ();
		public weak string get_desktop_id ();
		public weak string get_mime_types ();
		public static uint hash (void* mime_application);
		public bool is_usercreated ();
		public MimeApplication.from_desktop_id (string desktop_id);
		public MimeApplication.from_file (string path, string desktop_id);
	}
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public class MimeDatabase : GLib.Object {
		public weak ThunarVfs.MimeApplication add_application (ThunarVfs.MimeInfo info, string name, string exec) throws GLib.Error;
		public weak GLib.List get_applications (ThunarVfs.MimeInfo info);
		public static weak ThunarVfs.MimeDatabase get_default ();
		public weak ThunarVfs.MimeApplication get_default_application (ThunarVfs.MimeInfo info);
		public weak ThunarVfs.MimeInfo get_info (string mime_type);
		public weak ThunarVfs.MimeInfo get_info_for_data (void* data, ulong length);
		public weak ThunarVfs.MimeInfo get_info_for_file (string path, string name);
		public weak ThunarVfs.MimeInfo get_info_for_name (string name);
		public weak GLib.List get_infos_for_info (ThunarVfs.MimeInfo info);
		public bool remove_application (ThunarVfs.MimeApplication application) throws GLib.Error;
		public bool set_default_application (ThunarVfs.MimeInfo info, ThunarVfs.MimeApplication application) throws GLib.Error;
	}
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public class MimeHandler : GLib.Object {
		public bool exec (Gdk.Screen screen, GLib.List path_list) throws GLib.Error;
		public bool exec_with_env (Gdk.Screen screen, GLib.List path_list, string envp) throws GLib.Error;
		public weak string get_command ();
		public ThunarVfs.MimeHandlerFlags get_flags ();
		public weak string get_name ();
		public weak string lookup_icon_name (Gtk.IconTheme icon_theme);
		[NoAccessorMethod]
		public string command { get; construct; }
		[NoAccessorMethod]
		public ThunarVfs.MimeHandlerFlags flags { get; construct; }
		[NoAccessorMethod]
		public string icon { get; construct; }
		[NoAccessorMethod]
		public string name { get; construct; }
	}
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public class Monitor : GLib.Object {
		public weak ThunarVfs.MonitorHandle add_directory (ThunarVfs.Path path, ThunarVfs.MonitorCallback callback);
		public weak ThunarVfs.MonitorHandle add_file (ThunarVfs.Path path, ThunarVfs.MonitorCallback callback);
		public void feed (ThunarVfs.MonitorEvent event, ThunarVfs.Path path);
		public static weak ThunarVfs.Monitor get_default ();
		public void remove (ThunarVfs.MonitorHandle handle);
		public void wait ();
	}
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public class ThumbFactory : GLib.Object {
		public bool can_thumbnail (ThunarVfs.Info info);
		public weak Gdk.Pixbuf generate_thumbnail (ThunarVfs.Info info);
		public bool has_failed_thumbnail (ThunarVfs.Info info);
		public weak string lookup_thumbnail (ThunarVfs.Info info);
		public ThumbFactory (ThunarVfs.ThumbSize size);
		public bool store_thumbnail (Gdk.Pixbuf pixbuf, ThunarVfs.Info info) throws GLib.Error;
		[NoAccessorMethod]
		public ThunarVfs.ThumbSize size { get; construct; }
	}
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public class User : GLib.Object {
		public weak GLib.List get_groups ();
		public weak ThunarVfs.UserId get_id ();
		public weak string get_name ();
		public weak ThunarVfs.Group get_primary_group ();
		public weak string get_real_name ();
		public bool is_me ();
	}
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public class UserManager : GLib.Object {
		public weak GLib.List get_all_groups ();
		public static weak ThunarVfs.UserManager get_default ();
		public weak ThunarVfs.Group get_group_by_id (ThunarVfs.GroupId id);
		public weak ThunarVfs.User get_user_by_id (ThunarVfs.UserId id);
	}
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public class Volume : GLib.Object {
		public bool eject (Gtk.Widget? window) throws GLib.Error;
		public ThunarVfs.VolumeKind get_kind ();
		public weak ThunarVfs.Path get_mount_point ();
		public weak string get_name ();
		public ThunarVfs.VolumeStatus get_status ();
		public bool is_disc ();
		public bool is_ejectable ();
		public bool is_mountable ();
		public bool is_mounted ();
		public bool is_present ();
		public bool is_removable ();
		public weak string lookup_icon_name (Gtk.IconTheme icon_theme);
		public bool mount (Gtk.Widget? window) throws GLib.Error;
		public bool unmount (Gtk.Widget? window) throws GLib.Error;
		public virtual signal void changed ();
		public virtual signal void mounted ();
		public virtual signal void pre_unmount ();
		public virtual signal void unmounted ();
	}
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public class VolumeManager : GLib.Object {
		public static weak ThunarVfs.VolumeManager get_default ();
		public weak ThunarVfs.Volume get_volume_by_info (ThunarVfs.Info info);
		public weak GLib.List get_volumes ();
		public virtual signal void volume_mounted (ThunarVfs.Volume p0);
		public virtual signal void volume_pre_unmount (ThunarVfs.Volume p0);
		public virtual signal void volume_unmounted (ThunarVfs.Volume p0);
		public virtual signal void volumes_added (void* p0);
		public virtual signal void volumes_removed (void* p0);
	}
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public delegate void MonitorCallback (ThunarVfs.Monitor monitor, ThunarVfs.MonitorHandle handle, ThunarVfs.MonitorEvent event, ThunarVfs.Path handle_path, ThunarVfs.Path event_path);
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public const int THUNAR_VFS_MAJOR_VERSION;
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public const int THUNAR_VFS_MICRO_VERSION;
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public const int THUNAR_VFS_MINOR_VERSION;
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public const int THUNAR_VFS_PATH_MAXSTRLEN;
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public const int THUNAR_VFS_PATH_MAXURILEN;
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public static weak string canonicalize_filename (string filename);
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public static weak ThunarVfs.Job change_group (ThunarVfs.Path path, ThunarVfs.GroupId gid, bool recursive) throws GLib.Error;
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public static weak ThunarVfs.Job change_mode (ThunarVfs.Path path, ThunarVfs.FileMode dir_mask, ThunarVfs.FileMode dir_mode, ThunarVfs.FileMode file_mask, ThunarVfs.FileMode file_mode, bool recursive) throws GLib.Error;
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public static weak ThunarVfs.Job change_owner (ThunarVfs.Path path, ThunarVfs.UserId uid, bool recursive) throws GLib.Error;
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public static weak string check_version (uint required_major, uint required_minor, uint required_micro);
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public static weak ThunarVfs.Job copy_file (ThunarVfs.Path source_path, ThunarVfs.Path target_path) throws GLib.Error;
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public static weak ThunarVfs.Job copy_files (GLib.List source_path_list, GLib.List target_path_list) throws GLib.Error;
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public static weak ThunarVfs.Job create_file (ThunarVfs.Path path) throws GLib.Error;
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public static weak ThunarVfs.Job create_files (GLib.List path_list) throws GLib.Error;
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public static weak ThunarVfs.Job deep_count (ThunarVfs.Path path, ThunarVfs.DeepCountFlags flags) throws GLib.Error;
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public static weak string expand_filename (string filename) throws GLib.Error;
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public static weak string humanize_size (ThunarVfs.FileSize size, string buffer, ulong buflen);
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public static void init ();
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public static weak ThunarVfs.Job link_file (ThunarVfs.Path source_path, ThunarVfs.Path target_path) throws GLib.Error;
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public static weak ThunarVfs.Job link_files (GLib.List source_path_list, GLib.List target_path_list) throws GLib.Error;
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public static weak ThunarVfs.Job listdir (ThunarVfs.Path path) throws GLib.Error;
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public static weak ThunarVfs.Job make_directories (GLib.List path_list) throws GLib.Error;
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public static weak ThunarVfs.Job make_directory (ThunarVfs.Path path) throws GLib.Error;
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public static weak ThunarVfs.Job move_file (ThunarVfs.Path source_path, ThunarVfs.Path target_path) throws GLib.Error;
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public static weak ThunarVfs.Job move_files (GLib.List source_path_list, GLib.List target_path_list) throws GLib.Error;
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public static void shutdown ();
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public static weak string thumbnail_for_path (ThunarVfs.Path path, ThunarVfs.ThumbSize size);
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public static bool thumbnail_is_valid (string thumbnail, string uri, ThunarVfs.FileTime mtime);
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public static weak ThunarVfs.Job unlink_file (ThunarVfs.Path path) throws GLib.Error;
	[CCode (cheader_filename = "thunar-vfs/thunar-vfs.h")]
	public static weak ThunarVfs.Job unlink_files (GLib.List path_list) throws GLib.Error;
}