script_dir=$(cd $(dirname $0);pwd)
prj_dir=$script_dir/../
target_dir="generated-src/NF/FireSim-FireSimNutShellConfig-BaseNFConfig"
mkdir -p $target_dir
echo "You need put NutShell's FIRRTL file and anno file to $script_dir$target_dir"
java -Xmx16G -Dsbt.supershell=false -jar ${prj_dir}target-design/chipyard/generators/rocket-chip/sbt-launch.jar -Dsbt.sourcemode=true -Dsbt.workspace=${prj_dir}target-design/chipyard/tools  ";project {file:${prj_dir}/target-design/chipyard}firechip; runMain midas.stage.GoldenGateMain  -o ${prj_dir}/sim/generated-src/NF/FireSim-FireSimNutShellConfig-BaseNFConfig/FPGATop.v -i ${prj_dir}sim/generated-src/NF/FireSim-FireSimNutShellConfig-BaseNFConfig/FireSim.fir -td ${prj_dir}sim/generated-src/NF/FireSim-FireSimNutShellConfig-BaseNFConfig -faf ${prj_dir}sim/generated-src/NF/FireSim-FireSimNutShellConfig-BaseNFConfig/FireSim.anno.json -ggcp firesim.firesim -ggcs BaseNFConfig --no-dedup -E verilog "
