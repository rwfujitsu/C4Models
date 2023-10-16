/*
 * Diagram as Code
 * Created by Randolph Widjaja
 * Date: 05-10-2023
 * Version: 1.0

 
*/
Workspace "Windows 365" "High Level Design created with Visual Studio Code in Structurizr code (based on C4 Model)" {

    model {
 
            internet = softwaresystem  "Internet"
        
            


                W365OSDevices = softwaresystem "Endpoint OS Devices"{
                    OSClients = container "OS Clients" "Employee" "Devices"{
                        Windows = component "Windows"
                        iOSandIPadOS = component " iOS and IPadOS"
                        Linux = component "Linux"
                        macOS = component "MacOS"
                        Android = component "Android"
                        Web = component "Web"
                    }
                }

                W365Services = softwaresystem "W365 Services"{
                    EndUserPortal = container "End User Portal"
                    CapacityandRegionManagement = container "Capacity and Region Management"
                    ProvisioningService = container "Provisioning Service"
                    W365Storage =  container "Storage"
                    W365Compute =  container "Compute"{
                        CloudPC = component "Cloud PC"
                    }
                    
                    W365Network = container "Network"{
                        MicrosoftHostedNetwork = component "Microsoft Hosted Network (MHN)"
                        AzureNetworkConnection = component "Azure Network Connection (ANC)"
                    }
                    database = container "Database"
                }


                
                
                AzureVirtualDesktopService = softwaresystem "Azure Virtual Desktop Service"{
                    AzureGateway = container "Azure Gateway"
                    AzureBroker = container "Azure Broker"
                    AzureWeb = container "Azure Web"
                }
                
                
                AzureActiveDirectory = softwaresystem "Azure Active Directory" {
                    SingleSignOn = container "Single Sign On"
                    ConditionalAccess = container "Conditional Access"

                }

                AzureADSync = softwaresystem "Azure Active Directory Sync"

                AzureIntuneWebConsole = softwaresystem "Azure Intune Web Console"

                AzureConfigurationandReporting = softwaresystem "Configuration and Reporting"

                AzureGraphAPI = softwaresystem "Graph API"

                AzureGrouptargeting = softwaresystem "Group Targeting"

                AzureDevicecompliance = softwaresystem "Device Compliance"


                MicrosoftIntuneServices = softwaresystem "Microsoft Intune Services"{
                    ConfigurationDevices = container "Configuration Devices"{
                        EndpointSecurity = component "Endpoint Security"
                        ConfigurationPolicies = component "Configuration Policies"
                    }
                    ProtectData = container "Protect Data"{
                        IntuneConditionalAccess = component "Conditional Access"
                        IntuneDataTransfer = component "Data Transfer"                        
                    }
                    ManageApps = container "Manage Apps"{
                        LegacyApps = component "Legacy Apps"
                        StoreApps = component "Store Apps"                                                
                    }
                    AutoPilot = container "Auto Pilot"
                    CoManagement = container "Co Management"
                    RBAC = container "RBAC"
                              
                database2 = container "Microsoft Intune Services database"
                }
                
                WindowsUpdateforBusiness = softwaresystem "Windows Update for Business"

                WindowsAutoPatching = softwaresystem "Windows Auto Patching"

                MicrosoftDefenderforEndpoint = softwaresystem "Microsoft Defender for Endpoint"

                
                CustomerAzureSubscription = softwaresystem "Customer Azure Subsription"{
                    VirtualNetwork = container "Virtual Network"{
                        vNICandSubnet = component "vNIC and Subnet"
                        ExpressRoute = component "Express Rout"
                        AzureVPN = component "Azure VPN"                        
                    }                
                }
            
                ThirdPartyVPN = softwaresystem "Third-Party Virtual Private Network (VPN)"

                OnPremiseNetwork = softwaresystem "On-Premise Network"

                OnPremiseActiveDirectory = softwaresystem "Active Directory"

                MicrosoftConfigurationManager = softwaresystem "Microsoft Configuration Manager"



        # relationships between people and software systems
        internet -> W365OSDevices 
        

        internet -> AzureVirtualDesktopService 
        
       
        W365Network ->  internet 
        W365OSDevices -> W365Services 
    
        W365OSDevices -> EndUserPortal 
        


        AzureADSync -> AzureActiveDirectory 

        AzureIntuneWebConsole -> AzureActiveDirectory 

        AzureIntuneWebConsole -> AzureConfigurationandReporting 

        AzureConfigurationandReporting -> AzureActiveDirectory 


        AzureGraphAPI -> AzureConfigurationandReporting 
        AzureGraphAPI -> MicrosoftIntuneServices 

        AzureGrouptargeting -> AzureActiveDirectory 
        AzureDevicecompliance -> AzureActiveDirectory 
        AzureGrouptargeting -> MicrosoftIntuneServices 
        AzureDevicecompliance -> MicrosoftIntuneServices 

        W365Services -> MicrosoftIntuneServices 
 

        MicrosoftIntuneServices -> WindowsUpdateforBusiness  
        MicrosoftIntuneServices -> WindowsAutoPatching  
        MicrosoftIntuneServices -> MicrosoftDefenderforEndpoint  

        VirtualNetwork -> OnPremiseNetwork 
        OnPremiseNetwork -> OnPremiseActiveDirectory 
        OnPremiseNetwork -> MicrosoftConfigurationManager 
        OnPremiseActiveDirectory -> AzureADSync 

        ThirdPartyVPN -> CustomerAzureSubscription 
        ThirdPartyVPN -> OnPremiseNetwork 



        # relationships to/from containers
        CloudPC -> MicrosoftHostedNetwork 
   
        CloudPC -> AzureNetworkConnection 

        



        

        # relationships to/from components
        MicrosoftHostedNetwork -> AzureVirtualDesktopService 
        AzureNetworkConnection -> AzureVirtualDesktopService 

 
    }



    views {
        systemlandscape "SystemLandscape" {
            include *
            
        }


        systemContext W365OSDevices "W365OSDevices" {
            include *
            autoLayout
            }
        
        systemContext W365Services "W365Services" {
            include *
            autoLayout
            }
            
        systemContext AzureVirtualDesktopService "AzureVirtualDesktopService" {
            include *
            autoLayout
            }           

        container W365OSDevices "Container1"{
            include *
            autoLayout
        }
        
        container W365Services "Container2" {
            include *
            autoLayout
        }
        
        container AzureVirtualDesktopService "Container3" {
            include *
            autoLayout
        }


        component OSClients "Component1"{
            include *
            autoLayout
        }

        
        component W365Network "Component2" {
            include *
            autoLayout
        } 
                
        component W365Compute "Component3" {
            include *
            autoLayout
        } 
        
 styles {
            relationship "Relationship"  {
                color #000000
                dashed false
            }
    }

}
}