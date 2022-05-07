#ifndef __LOAD_MEM_H
#define __LOAD_MEM_H

#include "bridges/bridge_driver.h"
#include "fesvr/firesim_tsi.h"


class custom_loadmem_t
{
    public:
        custom_loadmem_t(simif_t* sim, const std::vector<std::string>& args,bool has_mem, int64_t mem_host_offset);
        ~custom_loadmem_t();
        bool loadmem_done = false;
	int64_t step_size;
	void loadmem_by_serial();
    private:
        simif_t* sim;
        firesim_tsi_t* fesvr;
        bool has_mem;
        // host memory offset based on the number of memory models and their size
        int64_t mem_host_offset;
	
        // Moves data to and from the widget and fesvr
        void check_loadmem_done();
        void tick();
        // Helper functions to handoff fesvr requests to the loadmem unit
        void handle_loadmem_read(firesim_loadmem_t loadmem);
        void handle_loadmem_write(firesim_loadmem_t loadmem);
        void serial_bypass_via_loadmem();
};


#endif // __LOAD_MEM_H
