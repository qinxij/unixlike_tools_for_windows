## Unixlike tools for windows
wget:     http://users.ugent.be/~bpuype/wget/
curl:	  http://curl.haxx.se/gknw.net/7.32.0/dist-w32/curl-7.32.0-rtmp-ssh2-ssl-sspi-zlib-idn-static-bin-w32.zip
gvim:     http://lilydjwg.vim-cn.com/share/gvim74-x64.3.exe
ln:       http://schinagl.priv.at/nt/ln/ln.html#contact
git:      http://code.google.com/p/msysgit/downloads/list?q=full+installer+official+git


Usage:
  1. Download git from the url and install it.

  2. Then use command: 

       git clone https://github.com/qinxij/unixlike_tools_for_windows.git c:/tools

  3. Add "C:\tools\" to environment varible `PATH`. Or use a .rc file powershell.

  3. Run command to configure gvim [Set-Alias gvim "C:\Program Files (x86)\Vim\vim74\gvim.exe"]:

       c:/tools/bootstrap_windows.ps1
