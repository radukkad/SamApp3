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
 * Write a description of class VMLibTester here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class VMLibTester
{
    // instance variables - replace the example below with your own
    private int x;
    private static VMLib vmlib=null;
    /**
     * Constructor for objects of class VMLibTester
     */
    public VMLibTester()
    {
        // initialise instance variables
        x = 0;
    }

    // Test case 1 -- getPowerState of a VM
    public static String test1 (String vmName) {
        String msg = vmlib.getPowerState(vmName);
        System.out.println("Test 1: Current Power State of VM: "+vmName+" = "+msg);
        return msg;
    }
     // Test case 2 -- PowerOff  a VM
    public static int test2 (String vmName) {
        String msg = vmlib.getPowerState(vmName);
        System.out.println("Test 2: Before PowerOff::Current state of VM: "+vmName+" = "+msg);
        if (msg.equals("poweredOn"))
        {
            vmlib.powerOff(vmName);
            msg = vmlib.getPowerState(vmName);
        }
        System.out.println("Test 2: After PowerOff::Current state of VM: "+vmName+" = "+msg);
        return 1;
    }
     // Test case 3 -- PowerOn a VM
    public static int test3 (String vmName) {
        String msg = vmlib.getPowerState(vmName);
        System.out.println("Test 3: Before PowerOn::Current state of VM: "+vmName+" "+msg);
        if (msg.equals("poweredOff"))
        {
            vmlib.powerOn(vmName);
            msg = vmlib.getPowerState(vmName);
        }
        System.out.println("Test 3: After PowerOn::Current state of VM: "+vmName+" "+msg);
        return 1;
    }
      // Test case 4 -- Clone a VM
      
    public static void cloneTestNew() throws Exception{
        String newVmName = "newVM";
        new VMLib().cloneVM(newVmName);
    }
    public static void cloneTest() throws Exception{
       // String msg = vmlib.getPowerState(vmName);
       // System.out.println("Test 4: Before Cloning VM: "+vmName+" = "+msg);
       String vmname = "group6-template";
       ServiceInstance si = new ServiceInstance(new URL(VMConfig.getVmwareHostURL()), VMConfig.getVmwareLogin(), VMConfig.getVmwarePassword(), true);
       Folder rootFolder = si.getRootFolder();
       VirtualMachine vmTemplate = (VirtualMachine) new InventoryNavigator(rootFolder).searchManagedEntity("VirtualMachine", vmname);
       if(vmTemplate==null)
       {
           System.out.println("VM " + vmname + " not found");
           si.getServerConnection().logout();
           throw new Exception("Source Virtual Machine Not Found");
        }
        else
        {
             System.out.println("VM " + vmname + "  found");
        }
       
        
        if (vmTemplate != null) {
            
            try {
               Folder teamFolder = (Folder) new InventoryNavigator(rootFolder).searchManagedEntity("Folder", "GROUP6");
               if(teamFolder==null)
               {
                   System.out.println("Not able to retrieve team folder");
                }
               VirtualMachineCloneSpec cloneSpec = createCloneSpec(si, false);
               Task task = vmTemplate.cloneVM_Task(teamFolder, "cmpe-vm19", cloneSpec);
                while (task.getTaskInfo().getState() == TaskInfoState.running) {
                                System.out.println(" Cloning in progress... ");
                                Thread.currentThread().sleep(3000);
                        }
                } catch (Exception e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                }
            
        }
        
     
    }
  
    public static void testConfigIp()
    {
        String vmname = "cmpe-vm18";
        String ipaddr = "130.65.150.218";
        String dns = "cmpe-vm18.engr.sjsu.edu";
        String hostname = "cmpe-vm18";
        System.out.println("Config network");
        new VMLib().configureNetwork(vmname,ipaddr,dns,hostname);
    }
    
    public static void main () throws Exception
    {
        String vmName = "cmpe-vm19";
        //String vmName = "clone-new";
        //vmlib = new VMLib(); 
        //String msg = vmlib.getPowerState(vmName);
        
        //if (msg.equals("poweredOff"))
        //{
        //    vmlib.powerOn(vmName);
        //    msg = vmlib.getPowerState(vmName);
        //}
        
        //System.out.println("msg: " + msg);
        
       
        //VirtualMachine vm = vmlib.getVMInstance(vmName).vm;
        ServiceInstance si = new ServiceInstance(new URL(VMConfig.getVmwareHostURL()), VMConfig.getVmwareLogin(), VMConfig.getVmwarePassword(), true);
        Folder rootFolder = si.getRootFolder();
        VirtualMachine vm = (VirtualMachine) new InventoryNavigator(rootFolder).searchManagedEntity("VirtualMachine", vmName);
        
         
         if(vm==null)
       {
           System.out.println("VM " + vmName + " not found");
           si.getServerConnection().logout();
           throw new Exception("Source Virtual Machine Not Found");
        }
        else
        {
             System.out.println("VM " + vmName + "  found");
        }
         
         GuestOperationsManager gom = si.getGuestOperationsManager();
 
        System.out.println("guest tool status:" + vm.getGuest().toolsRunningStatus);
        
        GuestAuthManager gam = gom.getAuthManager(vm);
        NamePasswordAuthentication npa = new NamePasswordAuthentication();
        npa.username = "root";
        npa.password = "passw0rd";
 
        
        GuestProgramSpec spec = new GuestProgramSpec();
        spec.programPath = "/home/radukkad/test.sh";
        spec.arguments = "130.65.150.218 130.65.150.219 cmpe-vm18.engr.sjsu.edu cmpe-vm19.engr.sjsu.edu  cmpe-vm18 cmpe-vm19";
        GuestProcessManager gpm = gom.getProcessManager(vm);
        long pid = gpm.startProgramInGuest(npa, spec);

        
        System.out.println("pid: " + pid);
        //vmlib.getVMInstance(vmName).si.getServerConnection().logout();
    
        /* Power Off a VM */
        //test2 (vmName);
        
        /* Power On a VM */
        //test3 (vmName);
        
        /*Cloning VM */
        //test4 (vmName, "rajesh_clone_to_surya@sjsu.edu");
        
        
        //vmlib.showVMInfo(vmName);
    }
    
     private static VirtualMachineCloneSpec createCloneSpec(ServiceInstance si,
                        boolean powerOn) throws InvalidProperty, RuntimeFault,
                        RemoteException, Exception {
                /*
                 * VirtualMachineCloneSpec cloneSpec = new VirtualMachineCloneSpec();
                 * cloneSpec.setLocation(new VirtualMachineRelocateSpec());
                 * cloneSpec.setPowerOn(false); cloneSpec.setTemplate(false);
                 */
                Folder rootFolder = si.getRootFolder();
                Datacenter dc = (Datacenter) new InventoryNavigator(rootFolder)
                                .searchManagedEntity("Datacenter", "CLOUD_LABS");
                HostSystem host = (HostSystem) new InventoryNavigator(rootFolder)
                                .searchManagedEntity("HostSystem","cmpe-pool3.engr.sjsu.edu");

                ResourcePool rp = null;
                ManagedEntity[] rps = new InventoryNavigator(dc)
                                .searchManagedEntities("ResourcePool");

                for (int i = 0; i < rps.length; i++) {
                    System.out.println("Resouces:"+ rps[i].getName());
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
                vmSpec.setName("cmpe-vm19");
                vmSpec.setMemoryMB(Long.valueOf("2048"));
                vmSpec.setNumCPUs(1);

                cloneSpec.setConfig(vmSpec);
                cloneSpec.setLocation(relocateSpec);
                cloneSpec.setPowerOn(powerOn);
                cloneSpec.setTemplate(false);

                return cloneSpec;

        }
}
