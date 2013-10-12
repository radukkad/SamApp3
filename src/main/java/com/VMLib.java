package com;

import java.util.Collection;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Set;
import java.net.URL;
import java.rmi.RemoteException;


import com.vmware.vim25.*;
import com.vmware.vim25.mo.Folder;
import com.vmware.vim25.mo.InventoryNavigator;
import com.vmware.vim25.mo.ServiceInstance;
import com.vmware.vim25.mo.Task;
import com.vmware.vim25.mo.VirtualMachine;
import com.vmware.vim25.mo.ManagedEntity;
import com.vmware.vim25.mo.ResourcePool;
import com.vmware.vim25.mo.ComputeResource;
import com.vmware.vim25.GuestProgramSpec;
import com.vmware.vim25.NamePasswordAuthentication;
import com.vmware.vim25.mo.Folder;
import com.vmware.vim25.mo.GuestAuthManager;
import com.vmware.vim25.mo.GuestOperationsManager;
import com.vmware.vim25.mo.GuestProcessManager;
import com.vmware.vim25.mo.HostSystem;
import com.vmware.vim25.mo.Datastore;
import com.vmware.vim25.mo.Datacenter;

import com.vmware.vim25.GuestNicInfo;
import com.vmware.vim25.HostConfigInfo;
import com.vmware.vim25.HostHardwareSummary;
import com.vmware.vim25.HostIpConfig;
import com.vmware.vim25.HostNetworkInfo;
import com.vmware.vim25.HostVirtualNic;
import com.vmware.vim25.HostVirtualNicSpec;
import com.vmware.vim25.ManagedObjectReference;
import com.vmware.vim25.ToolsConfigInfo;
import com.vmware.vim25.VirtualHardware;
import com.vmware.vim25.VirtualMachineConfigInfo;
import com.vmware.vim25.VirtualMachineFileInfo;
import com.vmware.vim25.VirtualMachineRuntimeInfo;
import com.vmware.vim25.mo.HostSystem;
import com.vmware.vim25.mo.ManagedEntity;
import com.vmware.vim25.mo.ResourcePool;
import com.vmware.vim25.mo.VirtualMachine;
import com.vmware.vim25.mo.CustomizationSpecManager;
/**
 * Write a description of class VMLib here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class VMLib
{
    // instance variables - replace the example below with your own
    private int x;
    private Hashtable vmList;

    /**
     * Constructor for objects of class VMLib
     */
    public VMLib()
    {
        vmList = new Hashtable();
    }
    
    public String initializeVM (String vmName) {
        // initialise instance variables
        String errMsg="";
        VMInfo vmInfo;
        System.out.println("\n*******Initializing VM::"+vmName);
        if (!vmList.containsKey(vmName)) {
           try {
                   vmInfo = new VMInfo(vmName);
                   if (vmInfo != null) {
                     vmInfo.si = new ServiceInstance(new URL(VMConfig.getVmwareHostURL()), 
                                        VMConfig.getVmwareLogin(), VMConfig.getVmwarePassword(), true);
                     Folder rootFolder = vmInfo.si.getRootFolder();
                     vmInfo.vm = (VirtualMachine) new InventoryNavigator(rootFolder).searchManagedEntity("VirtualMachine", vmName);
                     vmList.put(vmName, vmInfo); // not sure if the object will be null when it goes out of scope
                     if ((vmInfo.vm) == null && (vmInfo.si != null))
                     {
                          vmInfo.si.getServerConnection().logout();
                          errMsg = "initializeVM:: Unable to initialize VM " + vmName;
                     }
                   } 
                   else
                   {
                       errMsg = "initializeVM:: Unable to initialize VMInfo " + vmName;
                   }
                   
             } catch ( Exception e ) { System.out.println( e.toString() ) ; }
        } 
        else 
        {
            errMsg = "VM is already exist!";
        }
        return errMsg;
    }
    
    public VMInfo getVMInstance (String name) {
        Enumeration vmNames;
        VMInfo vmInfo;
        VMInfo tmpVMInfo;
        String vmName;
        vmInfo = new VMInfo();
        // Show all balances in hash table.
        vmNames = vmList.keys();
        while(vmNames.hasMoreElements()) {
         vmName = (String) vmNames.nextElement();
         System.out.println("*****->"+vmName);
         if (vmName.equals(name)) {
            System.out.println("MATCHING *****->"+vmName);
            tmpVMInfo = (VMInfo) vmList.get(vmName);

            vmInfo = tmpVMInfo;
        }
      }
      return vmInfo;
    }
    
    /**
     * Power On the Virtual Machine
     */
    public String powerOn(String vmName) 
    {
        String errMsg="";
        VMInfo vmInfo;
        
        if (vmList.containsKey(vmName)) {
            try {
                System.out.println("\n=========================");
                System.out.println("command: power on");
                //showPowerState();
                vmInfo = (VMInfo) vmList.get(vmName);
                if (vmInfo != null) {
                    Task task = vmInfo.vm.powerOnVM_Task(null);
                    if(task.waitForMe() == Task.SUCCESS)
                    {
                        System.out.println(vmName + " powered on");
                        errMsg = vmName + " powered on";
                    }
                }
            //showPowerState();
            } catch ( Exception e ) 
            { System.out.println( e.toString() ) ; }
        } else {
            errMsg = "VM: "+vmName+ " Not found in table";
        }
        return errMsg;
    }

    /**
     * Power Off the Virtual Machine
     */
    public String powerOff(String vmName) 
    {
        String errMsg="";
        VMInfo vmInfo;
        
        if (vmList.containsKey(vmName)) {
            try {
                System.out.println("\n=========================");
                System.out.println("command: power off");
                //showPowerState();
                vmInfo = (VMInfo) vmList.get(vmName);
                if (vmInfo != null) {
                    Task task = vmInfo.vm.powerOffVM_Task();
                    if(task.waitForMe() == Task.SUCCESS)
                    {
                        System.out.println(vmName + " powered off");
                        errMsg = vmName + " powered off";
                    }
                }
            //showPowerState();
            } catch ( Exception e ) 
            { System.out.println( e.toString() ) ; }
        } else {
            errMsg = "VM: "+vmName+ " Not found in table";
        }
        return errMsg;
    }

    /**
     * Reset the Virtual Machine
     */
    public String reset(String vmName) 
    {
          String errMsg="";
        VMInfo vmInfo;
        
        if (vmList.containsKey(vmName)) {
            try {
                System.out.println("\n=========================");
                System.out.println("command: reset");
                //showPowerState();
                vmInfo = (VMInfo) vmList.get(vmName);
                if (vmInfo != null) {
                    Task task = vmInfo.vm.resetVM_Task();
                    if(task.waitForMe() == Task.SUCCESS)
                    {
                        System.out.println(vmName + " reset");
                        errMsg = vmName + " reset";
                    }
                }
            //showPowerState();
            } catch ( Exception e ) 
            { System.out.println( e.toString() ) ; }
        } else {
            errMsg = "VM: "+vmName+ " Not found in table";
        }
        return errMsg;
    }
    
     /**
     * Suspend the Virtual Machine
     */
    public String suspend(String vmName) 
    {
          String errMsg="";
          VMInfo vmInfo;
        
        if (vmList.containsKey(vmName)) {
            try {
                System.out.println("\n=========================");
                System.out.println("command: suspend");
                //showPowerState();
                vmInfo = (VMInfo) vmList.get(vmName);
                if (vmInfo != null) {
                    Task task = vmInfo.vm.suspendVM_Task();
                    if(task.waitForMe() == Task.SUCCESS)
                    {
                        System.out.println(vmName + " suspend");
                        errMsg = vmName + " suspend";
                    }
                }
            //showPowerState();
            } catch ( Exception e ) 
            { System.out.println( e.toString() ) ; }
        } else {
            errMsg = "VM: "+vmName+ " Not found in table";
        }
        return errMsg;
    }
    
    public String configureNetwork(String vmName, String ipaddr, String dnsName, String hostName)
    {
        
        StringBuffer msg = new StringBuffer();
        VMInfo vmInfo;
        initializeVM(vmName);
        if (vmList.containsKey(vmName)) {
            try {
                msg.append("\n=========================");
                //showPowerState();
                vmInfo = (VMInfo) vmList.get(vmName);
                if (vmInfo != null) {
                    
                    Folder rootFolder = vmInfo.si.getRootFolder();
                    GuestOperationsManager gom = vmInfo.si.getGuestOperationsManager();
                    msg.append("guest tool status:" + vmInfo.vm.getGuest().toolsRunningStatus);
        
                    GuestAuthManager gam = gom.getAuthManager(vmInfo.vm);
                    NamePasswordAuthentication npa = new NamePasswordAuthentication();
                    npa.username = "root";
                    npa.password = "passw0rd";
                    
                    GuestProgramSpec spec = new GuestProgramSpec();
                    spec.programPath = "/home/radukkad/test.sh";
                    spec.arguments = "130.65.150.218 "+ ipaddr +" cmpe-vm18.engr.sjsu.edu "+ dnsName +"  cmpe-vm18 "+ hostName;
                    GuestProcessManager gpm = gom.getProcessManager(vmInfo.vm);
                    long pid = gpm.startProgramInGuest(npa, spec);
                    
                    msg.append("pid: " + pid);
               
                }
            //showPowerState();
            } catch ( Exception e ) 
            { System.out.println( e.toString() ) ; }
        } else {
            msg.append("VM: "+vmName+ " Not found in table");
        }
        return msg.toString();
        
    }
    
    public String cloneVM (String clone_name ) 
    {
        String vmName = "group6-template";
        StringBuffer msg = new StringBuffer();
        msg.append("Template used for cloning :"+ vmName);
        try {
            ServiceInstance si = new ServiceInstance(new URL(VMConfig.getVmwareHostURL()), 
                                            VMConfig.getVmwareLogin(), VMConfig.getVmwarePassword(), true);
            Folder rootFolder = si.getRootFolder();
            VirtualMachine vmTemplate = (VirtualMachine) new InventoryNavigator(rootFolder).searchManagedEntity("VirtualMachine", vmName);
            if(vmTemplate ==null)
           {
               msg.append("VM " + vmName + " not found");
               si.getServerConnection().logout();
            }
            else
            {
			        	msg.append("Template found ");
            }
            if ( vmTemplate != null) {
               Folder teamFolder = (Folder) new InventoryNavigator(rootFolder).searchManagedEntity("Folder", "GROUP6");
               if(teamFolder==null)
               {
             	   msg.append("Not able to retrieve team folder");
               }
               VirtualMachineCloneSpec cloneSpec = createCloneSpec(clone_name, si, false);
               Task task = vmTemplate.cloneVM_Task(teamFolder, clone_name, cloneSpec);
               msg.append("Launching the VM clone task. Please wait ...") ;
               if(task.waitForMe() == Task.SUCCESS)
               {
                   msg.append(vmName+" Cloned successfully.");
               } 
               else
               {
                   msg.append("Failure! VM "+vmName+" cannot be cloned");
               }
            
            
        }
        } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
        }
        return msg.toString();
    }

    public String showVMInfo(String vmName)
    {
        VMInfo vmInfo;
        String errMsg="";
        System.out.println("\n============ Virtual Machine "+vmName+" Info ============");
         if (vmList.containsKey(vmName)) {
            vmInfo = (VMInfo) vmList.get(vmName);
            if (vmInfo != null) {
                VirtualMachineConfigInfo vmConfigInfo = vmInfo.vm.getConfig();
                VirtualMachineCapability vmc = vmInfo.vm.getCapability();
                System.out.println("VM: " + vmInfo.vm.getName());
                System.out.println("GuestOS: " + vmConfigInfo.getGuestFullName());
                System.out.println("Multiple snapshot supported: " + vmc.isMultipleSnapshotsSupported());
                VirtualMachineSummary vmsum = vmInfo.vm.getSummary() ;
                VirtualMachineQuickStats vmstats = vmsum.getQuickStats() ;
                System.out.printf( "Guest Memory Usage: %d MB\n", vmstats.getGuestMemoryUsage() ) ;
                System.out.printf( "Host Memory Usage: %d MB\n", vmstats.getHostMemoryUsage() ) ;
                System.out.printf( "Overall CPU Usage: %d MHz\n", vmstats.getOverallCpuUsage() ) ;
                VirtualMachineRuntimeInfo runtime = vmsum.getRuntime();
                System.out.println( "VM Boot Time: "  +  runtime.getBootTime() ) ;
                //System.out.println( "VM Connection State: " + runtime.getConnectionState() ) ;
                System.out.printf( "Suspend Interval: %d\n", runtime.getSuspendInterval() ) ;
                System.out.println( "Suspend Time: " + runtime.getSuspendTime() ) ;
            } 
            else 
            {
                errMsg = "cloneVM:: Unable to get "+vmName+ "from table";  
                System.out.println(errMsg);
            }
        }
        else 
        {
            errMsg = "cloneVM:: Unable to get "+vmName+ "from table";  
            System.out.println(errMsg);
        }
        return errMsg;
    }
    
    public String getPowerState (String vmName)
    {
        VMInfo vmInfo;
        String msg="";
        if (vmList.containsKey(vmName)) {
            vmInfo = (VMInfo) vmList.get(vmName);
            if (vmInfo != null) {
                VirtualMachineRuntimeInfo vmri = vmInfo.vm.getRuntime();
                VirtualMachinePowerState powerstate = vmri.getPowerState();
                System.out.println( "VM: "+vmName+" Power State: " + powerstate.toString() ) ;   
                msg = powerstate.toString();
            }
        }
        else
        {
            msg = "getPowerState:: Unable to get "+vmName+ "from table";  
            System.out.println(msg);
        }
        return msg;
    }

    /**
     * Destructor for objects of class MyVM
     */
    protected void finalize() throws Throwable
    {
        Enumeration vmNames;
        VMInfo vmInfo;
        String vmName="";
        // Show all balances in hash table.
        vmNames = vmList.keys();
        while(vmNames.hasMoreElements()) {
         vmName = (String) vmNames.nextElement();
         System.out.println("Finalizing *****->"+vmName);
         vmInfo = (VMInfo)vmList.get(vmName);
         vmInfo.si.getServerConnection().logout(); //do finalization here
         vmList.remove(vmName);
        }
      super.finalize(); //not necessary if extending Object.
    }
    

     private static VirtualMachineCloneSpec createCloneSpec(String vmName,ServiceInstance si,
                        boolean powerOn) throws InvalidProperty, RuntimeFault,
                        RemoteException, Exception {
       
            Folder rootFolder = si.getRootFolder();
            Datacenter dc = (Datacenter) new InventoryNavigator(rootFolder)
                            .searchManagedEntity("Datacenter", "CLOUD_LABS");
            HostSystem host = (HostSystem) new InventoryNavigator(rootFolder)
                            .searchManagedEntity("HostSystem","cmpe-pool3.engr.sjsu.edu");

            ResourcePool rp = null;
            ManagedEntity[] rps = new InventoryNavigator(dc)
                            .searchManagedEntities("ResourcePool");

            for (int i = 0; i < rps.length; i++) {
                    if (rps[i].getName().equals("Test")) {
                            rp = (ResourcePool) rps[i];
                    }
            }

            Datastore ds = (Datastore) new InventoryNavigator(rootFolder)
                            .searchManagedEntity("Datastore", "datastore1_pool3");
                            
            VirtualMachineCloneSpec cloneSpec = new VirtualMachineCloneSpec();
            VirtualMachineRelocateSpec relocateSpec = new VirtualMachineRelocateSpec();
            relocateSpec.setHost(host.getMOR());
            relocateSpec.setPool(rp.getMOR());
            relocateSpec.setDatastore(ds.getMOR());
            
            
            VirtualMachineConfigSpec vmSpec = new VirtualMachineConfigSpec();
            vmSpec.setName(vmName);
            vmSpec.setMemoryMB(Long.valueOf("2048"));
            vmSpec.setNumCPUs(1);

            cloneSpec.setConfig(vmSpec);
            cloneSpec.setLocation(relocateSpec);
            cloneSpec.setPowerOn(powerOn);
            cloneSpec.setTemplate(false);

            return cloneSpec;

        }
    }
