
set TopModule "bfs"
set ClockPeriod 10
set ClockList ap_clk
set HasVivadoClockPeriod 0
set CombLogicFlag 0
set PipelineFlag 0
set DataflowTaskPipelineFlag 1
set TrivialPipelineFlag 0
set noPortSwitchingFlag 0
set FloatingPointFlag 0
set FftOrFirFlag 0
set NbRWValue 0
set intNbAccess 0
set NewDSPMapping 1
set HasDSPModule 0
set ResetLevelFlag 0
set ResetStyle control
set ResetSyncFlag 1
set ResetRegisterFlag 0
set ResetVariableFlag 0
set ResetRegisterNum 0
set FsmEncStyle onehot
set MaxFanout 0
set RtlPrefix {}
set RtlSubPrefix bfs_
set ExtraCCFlags {}
set ExtraCLdFlags {}
set SynCheckOptions {}
set PresynOptions {}
set PreprocOptions {}
set SchedOptions {}
set BindOptions {}
set RtlGenOptions {}
set RtlWriterOptions {}
set CbcGenFlag {}
set CasGenFlag {}
set CasMonitorFlag {}
set AutoSimOptions {}
set ExportMCPathFlag 0
set SCTraceFileName mytrace
set SCTraceFileFormat vcd
set SCTraceOption all
set TargetInfo xc7z020:-clg484:-1
set SourceFiles {sc {} c ../../../CCOde_bulk/bfs.c}
set SourceFlags {sc {} c {{}}}
set DirectiveFile C:/Users/ekarabu/Desktop/Aydin_amro/github_files/Scheduling-PR/IPs/bfs/bulk_HLS/bulk_HLS/bulk_HLS/bulk_HLS.directive
set TBFiles {verilog {../../../CCOde_bulk/harness.c ../../../CCOde_bulk/support.c ../../../CCOde_bulk/support.h} bc {../../../CCOde_bulk/harness.c ../../../CCOde_bulk/support.c ../../../CCOde_bulk/support.h} vhdl {../../../CCOde_bulk/harness.c ../../../CCOde_bulk/support.c ../../../CCOde_bulk/support.h} sc {../../../CCOde_bulk/harness.c ../../../CCOde_bulk/support.c ../../../CCOde_bulk/support.h} cas {../../../CCOde_bulk/harness.c ../../../CCOde_bulk/support.c ../../../CCOde_bulk/support.h} c {}}
set SpecLanguage C
set TVInFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set TVOutFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set TBTops {verilog {} bc {} vhdl {} sc {} cas {} c {}}
set TBInstNames {verilog {} bc {} vhdl {} sc {} cas {} c {}}
set XDCFiles {}
set ExtraGlobalOptions {"area_timing" 1 "clock_gate" 1 "impl_flow" map "power_gate" 0}
set TBTVFileNotFound {}
set AppFile ../hls.app
set ApsFile bulk_HLS.aps
set AvePath ../..
set DefaultPlatform DefaultPlatform
set multiClockList {}
set SCPortClockMap {}
set intNbAccess 0
set PlatformFiles {{DefaultPlatform {xilinx/zynq/zynq xilinx/zynq/zynq_fpv6}}}
set HPFPO 0
