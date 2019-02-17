#1.	При помощи WMI перезагрузить все виртуальные машины.

set-item wsman:\localhost\Client\TrustedHosts -value *

$names = @("VM1","VM2","VM2")
Get-WmiObject Win32_OperatingSystem –computer $names -Credential Administrator | Invoke-WmiMethod –Name Reboot

#2.	При помощи WMI просмотреть список запущенных служб на удаленном компьютере.

Get-WmiObject Win32_Service -ComputerName VM1, VM2, VM3

#3.	Настроить PowerShell Remoting, для управления всеми виртуальными машинами с хостовой.
Enable-PSRemoting

Set-WSManQuickConfig

set-item wsman:\localhost\Client\TrustedHosts -value *

Enter-PSSession -ComputerName VM1 -Credential VM1\Administrator

#4.	Для одной из виртуальных машин установить для прослушивания порт 42658. Проверить работоспособность PS Remoting.
#Установка порта 42658 для прослушивания на ET_VM1
Set-Item WSMan:\localhost\Listener\Listener*\port -Value 42658

#5.	Создать конфигурацию сессии с целью ограничения использования всех команд, кроме просмотра содержимого дисков.
