Config { font = "-misc-fixed-*-*-*-*-12-*-*-*-*-*-*-*"
       , bgColor = "black"
       , fgColor = "grey"
       , position = TopW L 95
       , lowerOnStart = True,
       , commands = [ Run Weather "EDLW" ["-t","<tempC>C","-L","04","-H","26","-n","#CEFFAC","-h","#FFB6B0","-l","#96CBFE"] 600
                    , Run MultiCpu ["-L","30","-H","60","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC","-w","3"] 10
                    , Run Memory ["-H","8192","-L","4096","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10
                    , Run Swap ["-H","1024","-L","512","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10
                    , Run Network "eth0" ["-H","200","-L","10","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10
                    , Run Network "wlan0" ["-L","0","-H","32","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10
                    , Run Date "%a %b %_d %l:%M" "date" 10
                    , Run BatteryP ["BAT0"]
                                   ["-t", "<acstatus><watts> (<left>%)",
                                    "-L", "10", "-H", "80", "-p", "3",
                                    "--", "-O", "<fc=green>On</fc> - ", "-o", "",
                                    "-L", "-15", "-H", "-5",
                                    "-l", "red", "-m", "blue", "-h", "green",
                                    "-c", "energy_full"] -- charge_full_design"]
                                   60
                    , Run StdinReader
                    ]
       , sepChar = "%",
       , alignSep = "}{",
       , template = "%StdinReader% }{ %multicpu% %memory% %swap% %eth0% %wlan0% %battery% <fc=#FFFFCC>%date%</fc> %EDLW%"
       }
