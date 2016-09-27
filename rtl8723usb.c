
#include "rtl_common.h"
#include "rtl8723usb.h"

#include <linux/usb.h>
#include <linux/mod_devicetable.h>


//usb ID 0bda:b720 Realtek Semiconductor Corp.


struct usb_device_id rtl_usb_id_table[] = {
	{ USB_DEVICE( 0x0bda, 0xb720 ), .driver_info=0xffff },

	{ 0, },

};

MODULE_AUTHOR(AUTHOR);
MODULE_VERSION("0.0.0");
MODULE_DESCRIPTION("Realtek RTL8723 USB Wireless LAN driver.");
MODULE_SUPPORTED_DEVICE("Realtek RTL8723 USB chipset based cards");
MODULE_DEVICE_TABLE( usb, rtl_usb_id_table );
MODULE_FIRMWARE(FIRMWARE_RTL8723);
MODULE_LICENSE("GPL");
