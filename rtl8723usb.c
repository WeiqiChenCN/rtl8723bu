
#include "rtl_common.h"
#include "rtl8723usb.h"

#include <linux/usb.h>
#include <linux/mod_devicetable.h>


//usb ID 0bda:b720 Realtek Semiconductor Corp.


struct usb_device_id rtl8723_usb_id_table[] = {
    { USB_DEVICE( 0x0bda, 0xb720 ), .driver_info=0xffff },

    { 0, },

};




int rtl8723_usb_probe( 
        struct usb_interface *intf,
        const struct usb_device_id *id
){
    printk( KERN_DEBUG "%s is called.", __func__ );
    return 0;
}
                            
void rtl8723_usb_disconnect( struct usb_interface *intf ){
    printk( KERN_DEBUG "%s is called.", __func__ );
    return ;
}
int rtl8723_usb_suspend( 
        struct usb_interface *intf, 
        pm_message_t message
){
    printk( KERN_DEBUG "%s is called.", __func__ );
    return 0;
}

int rtl8723_usb_resume( struct usb_interface *intf ){
    printk( KERN_DEBUG "%s is called.", __func__ );
    return 0;
}



struct usb_driver rtl8723usb_driver = {
    .name       = KBUILD_MODNAME,
    .id_table   = rtl8723_usb_id_table,
    .probe      = rtl8723_usb_probe,
    .disconnect = rtl8723_usb_disconnect,
    .suspend    = rtl8723_usb_suspend,
    .resume     = rtl8723_usb_resume,
    .reset_resume   = rtl8723_usb_resume,
    .disable_hub_initiated_lpm = 1,
};


module_usb_driver( rtl8723usb_driver );

MODULE_AUTHOR(AUTHOR);
MODULE_VERSION("0.0.0");
MODULE_DESCRIPTION("Realtek RTL8723BU USB Wireless LAN driver.");
MODULE_SUPPORTED_DEVICE("Realtek RTL8723BU USB chipset based cards");
MODULE_DEVICE_TABLE( usb, rtl8723_usb_id_table );
MODULE_FIRMWARE(FIRMWARE_RTL8723);
MODULE_LICENSE("GPL");

