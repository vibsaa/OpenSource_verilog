# OpenSource_verilog
A brief go through for writing and simulating verilog codes using open source softwares- iverilog and GTKwave


## iverilog & GTKwave:
These can be downloaded and installed from the source below:
http://bleyer.org/icarus/

1) select your suitable version and install using "Complete Installation(Installs GTKwave also)" option.
2) Also check 'add to path' option while installing. 

## commands to run:
### A) Verilog on iverilog:
In here I have used vscode powershell/terminal only to run the commands below directly.

#### 1) iverilog -o output_filename.vvp input_filename.v
#### 2) vvp output_filename.vvp

![Screenshot (217)](https://user-images.githubusercontent.com/20024712/102868091-c1446900-445f-11eb-8f37-db3410f03c4e.png)
### B) Simulation on GTKwave:
#### 1) gtkwave output_filename.vcd
After the UI open select the module, and then select and put the available signals to view window.
![Screenshot (218)](https://user-images.githubusercontent.com/20024712/102868088-c0abd280-445f-11eb-8002-49af83098f6c.png)


