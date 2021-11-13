 param (
    [string]$wd=$PSScriptRoot
 )
Set-Location $wd

$myE = Resolve-Path '.'
$myE = $myE.Path + '\DocumentationCapture.exe'
Copy-Item -Path $myE -Destination C:\DocumentationCapture.exe -Force
$conf = Resolve-Path '.\conf.json'
Set-Location C:\
Start-Process -verb runas "C:\DocumentationCapture.exe" -ArgumentList $conf

Write-Host 'Press Any Key!' -NoNewline
$null = [Console]::ReadKey('?')

<#
   .NOTES
    ===========================================================================
     Created with:  SAPIEN Technologies, Inc., PowerShell Studio 2014 v4.1.58
     Created on:    2017/12/29 
     Created by:    hokis
    ===========================================================================
    .DESCRIPTION
        1��������ʾ������ָ������������
        2��FindWindow ��������ȡָ�����ھ������һ����Ϊ���ڵ�����(��Ϊ��)���ڶ�����Ϊ���ڱ����ı�
        3��ShowWindow ����������ָ�����ڵ���ʾ״̬����һ����Ϊָ�����ڵľ�����ڶ�������Ϊ��Ҫ���õ�״̬(���ֳ���ֵ��0-���أ�1-������ʾ��2-��С����3-��󻯣�9-��ԭ)
#>

$code = @'
[DllImport("user32.dll", EntryPoint = "FindWindow")] public extern static IntPtr FindWindow(string lpClassName, string lpWindowName);
[DllImport("user32.dll", EntryPoint = "ShowWindow", CharSet = CharSet.Auto)] public extern static bool ShowWindow(IntPtr hwnd, uint nCmdShow);
'@
#����API
$myAPI = Add-Type -MemberDefinition $code -Name myAPI -PassThru
#����CMD���ڣ���������һ��CMD���ڣ�
$cmdWin = "lqJnMCy7fOFsS4ZG"
#��ʾ��1��9�������أ�0��
$myapi::ShowWindow($myAPI::FindWindow("ConsoleWindowClass", $cmdWin), 0)

Write-Host 'Press Any Key!' -NoNewline
$null = [Console]::ReadKey('?')