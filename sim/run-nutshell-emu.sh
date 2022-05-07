#VFireSim          no wave dump
#VFireSim-debug    wave dump as dump.vcd


if [ ! -n "$1" ] ;then
    echo "You must input the path of executable file to run the emulation."
    exit 1
fi

cd generated-src/NF/FireSim-FireSimNutShellConfig-BaseNFConfig && \
./VFireSim ${1} +fesvr-step-size=128 +no-bootrom +mm_relaxFunctionalModel_0=0 +mm_writeMaxReqs_0=10 +mm_readMaxReqs_0=10 +mm_writeLatency_0=30 +mm_readLatency_0=30  +mm_relaxFunctionalModel_1=0 +mm_writeMaxReqs_1=10 +mm_readMaxReqs_1=10 +mm_writeLatency_1=30 +mm_readLatency_1=30 +shmemportname0=0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 +macaddr0=00:00:00:00:00:02 +niclog0=niclog0 +linklatency0=6405 +netbw0= +netburst0=8 +nic-loopback0 +tracefile=TRACEFILE +blkdev-in-mem0=128 +blkdev-log0=blkdev-log0 +autocounter-readrate=1000 +autocounter-filename=AUTOCOUNTERFILE +dramsim +memsize=8388608  +max-cycles=50000
