#verilator
#verilator-debug
script_dir=$(cd $(dirname $0);pwd)/
prj_dir=$script_dir../
echo $prj_dir
if [ ! -n "$1" ] ;then
    echo "You must input \"verilator\" or \"verilator-debug\" to use this script."
    exit 1
fi

export CFLAGS=" -g -I${prj_dir}target-design/chipyard/generators/testchipip/src/main/resources/testchipip/csrc -I${prj_dir}sim/firesim-lib/src/main/cc -I${prj_dir}sim/src/main/cc/firesim -I${prj_dir}target-design/chipyard/riscv-tools-install/include -I${prj_dir}sim/firesim-lib/src/main/cc/lib/boost -I${prj_dir}target-design/chipyard/tools/dromajo/dromajo-src/src -I${prj_dir}sim/generated-src/NF/FireSim-FireSimNutShellConfig-BaseNFConfig -Wno-unused-variable -O0 -D RTLSIM -std=c++11 -Wall -I${prj_dir}target-design/chipyard/tools/DRAMSim2 -I${prj_dir}target-design/chipyard/generators/testchipip/src/main/resources/testchipip/csrc -I${prj_dir}sim/midas/src/main/cc -I${prj_dir}sim/midas/src/main/cc/utils -include ${prj_dir}sim/generated-src/NF/FireSim-FireSimNutShellConfig-BaseNFConfig/FireSim-const.h" 
export LDFLAGS=" -L${prj_dir}target-design/chipyard/riscv-tools-install/lib -l:libdwarf.so -l:libelf.so -lz -L${prj_dir}target-design/chipyard/tools/dromajo/dromajo-src/src -ldromajo_cosim -lrt -L${prj_dir}sim/generated-src/NF/FireSim-FireSimNutShellConfig-BaseNFConfig -lstdc++ -lpthread -lgmp -lmidas  "
export DRIVER="${prj_dir}sim/src/main/cc/firesim/firesim_nf.cc ${prj_dir}sim/src/main/cc/firesim/firesim_top.cc ${prj_dir}sim/src/main/cc/firesim/systematic_scheduler.cc ${prj_dir}sim/firesim-lib/src/main/cc/bridges/uart.cc ${prj_dir}sim/firesim-lib/src/main/cc/bridges/groundtest.cc ${prj_dir}sim/firesim-lib/src/main/cc/bridges/load_mem.cc ${prj_dir}sim/firesim-lib/src/main/cc/bridges/dromajo.cc ${prj_dir}sim/firesim-lib/src/main/cc/bridges/blockdev.cc ${prj_dir}sim/firesim-lib/src/main/cc/bridges/serial.cc  ${prj_dir}sim/firesim-lib/src/main/cc/bridges/simplenic.cc ${prj_dir}sim/firesim-lib/src/main/cc/fesvr/firesim_tsi.cc ${prj_dir}sim/firesim-lib/src/main/cc/bridges/addresstest.cc  ${prj_dir}target-design/chipyard/riscv-tools-install/lib/libfesvr.a ${prj_dir}target-design/chipyard/tools/dromajo/dromajo-src/src/libdromajo_cosim.a ${prj_dir}target-design/chipyard/generators/testchipip/src/main/resources/testchipip/csrc/testchip_tsi.cc"
make -j8 VM_PARALLEL_BUILDS=1 -C ${script_dir}midas/src/main/cc ${1} PLATFORM=NF DESIGN=FireSim GEN_DIR=${script_dir}generated-src/NF/FireSim-FireSimNutShellConfig-BaseNFConfig TOP_DIR=${prj_dir}target-design/chipyard VERILATOR_FLAGS="--assert"
