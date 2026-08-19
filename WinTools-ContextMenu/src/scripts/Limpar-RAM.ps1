$definition = @'
using System;
using System.Runtime.InteropServices;

public class RamCleaner {
    [DllImport("advapi32.dll", SetLastError = true)]
    internal static extern bool OpenProcessToken(IntPtr ProcessHandle, uint DesiredAccess, out IntPtr TokenHandle);

    [DllImport("advapi32.dll", SetLastError = true, CharSet = CharSet.Auto)]
    internal static extern bool LookupPrivilegeValue(string lpSystemName, string lpName, out long lpLuid);

    [DllImport("advapi32.dll", SetLastError = true)]
    internal static extern bool AdjustTokenPrivileges(IntPtr TokenHandle, bool DisableAllPrivileges, ref TOKEN_PRIVILEGES NewState, int BufferLength, IntPtr PreviousState, IntPtr ReturnLength);

    [DllImport("ntdll.dll", SetLastError = true)]
    internal static extern uint NtSetSystemInformation(int SystemInformationClass, ref int SystemInformation, int SystemInformationLength);

    [DllImport("psapi.dll")]
    internal static extern int EmptyWorkingSet(IntPtr hw);

    [StructLayout(LayoutKind.Sequential, Pack = 1)]
    internal struct TOKEN_PRIVILEGES {
        public int PrivilegeCount;
        public long Luid;
        public int Attributes;
    }

    public static void EnablePrivileges() {
        IntPtr hToken;
        OpenProcessToken(System.Diagnostics.Process.GetCurrentProcess().Handle, 0x0020 | 0x0008, out hToken);
        
        long luid;
        LookupPrivilegeValue(null, "SeProfileSingleProcessPrivilege", out luid);

        TOKEN_PRIVILEGES tp = new TOKEN_PRIVILEGES();
        tp.PrivilegeCount = 1;
        tp.Luid = luid;
        tp.Attributes = 0x00000002;

        AdjustTokenPrivileges(hToken, false, ref tp, 0, IntPtr.Zero, IntPtr.Zero);
    }

    public static void ExecuteFullClean() {
        EnablePrivileges();

        foreach (System.Diagnostics.Process proc in System.Diagnostics.Process.GetProcesses()) {
            try { EmptyWorkingSet(proc.Handle); } catch {}
        }

        int command = 2; NtSetSystemInformation(0x50, ref command, 4);
        command = 3; NtSetSystemInformation(0x50, ref command, 4);
        command = 4; NtSetSystemInformation(0x50, ref command, 4);
        command = 5; NtSetSystemInformation(0x50, ref command, 4);

        GC.Collect();
    }
}
'@

Add-Type -TypeDefinition $definition -ErrorAction SilentlyContinue
[RamCleaner]::ExecuteFullClean()
