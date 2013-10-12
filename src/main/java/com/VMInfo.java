package com;

import com.vmware.vim25.mo.ServiceInstance;
import com.vmware.vim25.mo.VirtualMachine;

/**
 * Write a description of class VMInfo here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class VMInfo
{
    String vmname;
    ServiceInstance si;
    VirtualMachine vm;

    /**
     * Constructor for objects of class VMInfo
     */
    public VMInfo()
    {
    }
    public VMInfo (String name)
    {
        vmname = name;
    }
}
