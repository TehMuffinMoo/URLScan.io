function Detect-OS {
    if ($PSVersionTable.PSVersion.ToString() -gt 6) {
      if ($IsWindows) {
        return "Windows"
      } elseif ($IsMacOS) {
        return "Mac"
      }
    } else {
      $Platform = [System.Environment]::OSVersion.Platform
      if ($Platform -like "Win*") {
        return "Windows"
      } elseif ($Platform -like "Unix*") {
        return "Unix"
      }
    }
  }