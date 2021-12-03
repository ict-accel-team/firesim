// See LICENSE for license details.

#ifndef __SIMIF_NF_H
#define __SIMIF_NF_H

#include "simif.h"

class simif_nf_t: public virtual simif_t
{
  public:
    simif_nf_t();
    virtual ~simif_nf_t() { }

  private:
    volatile uintptr_t* dev_vaddr;
    const static uintptr_t dev_paddr = 0x43C00000; 
  
  protected:
    virtual void write(size_t addr, uint32_t data);
    virtual uint32_t read(size_t addr);
    virtual size_t pread(size_t addr, char* data, size_t size) {
      // Not supported
      return 0;
    }
};

#endif // __SIMIF_NF_H
