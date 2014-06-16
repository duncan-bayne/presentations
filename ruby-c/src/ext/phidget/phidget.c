// Derived from sample code that is Copyright 2008 Phidgets Inc.
// This work is licensed under the Creative Commons Attribution 2.5 Canada License.
// view a copy of this license, visit http://creativecommons.org/licenses/by/2.5/ca/

#include <assert.h>
#include <phidget21.h>
#include <ruby.h>
#include <stdio.h>

void Init_phidget();
int CCONV toggle_led(CPhidgetHandle IFK, void *userptr);
VALUE method_toggle_led(VALUE led_number);

VALUE Phidget = Qnil;
int led_on;

int CCONV toggle_led(CPhidgetHandle IFK, void *userptr)
{
  int idx_led;
  int on_0;
  int on_7;

  CPhidgetInterfaceKit_getOutputState((CPhidgetInterfaceKitHandle)IFK, 0, &on_0);
  CPhidgetInterfaceKit_getOutputState((CPhidgetInterfaceKitHandle)IFK, 7, &on_7);

  if (on_0) {
    led_on = 7;
  } else {
    led_on = 0;
  }

  for (idx_led = 0; idx_led < 8; idx_led ++) {
    CPhidgetInterfaceKit_setOutputState((CPhidgetInterfaceKitHandle)IFK, idx_led, 0);
  }

  CPhidgetInterfaceKit_setOutputState((CPhidgetInterfaceKitHandle)IFK, led_on, 1);

  return 0;
}

VALUE method_toggle_led(VALUE led_number)
{
  int result;

  CPhidgetInterfaceKitHandle ifKit = 0;
  CPhidgetInterfaceKit_create(&ifKit);
  CPhidget_set_OnAttach_Handler((CPhidgetHandle)ifKit, toggle_led, NULL);

  CPhidget_open((CPhidgetHandle)ifKit, -1);
  result = CPhidget_waitForAttachment((CPhidgetHandle)ifKit, 1000);
  assert(result == 0);

  CPhidget_close((CPhidgetHandle)ifKit);
  CPhidget_delete((CPhidgetHandle)ifKit);

  /*
                                             ________
                                    , -‘”                   ``~ ,
                             , -”                                   “- ,
                         ,/                                               ”:,
                     ,?                                                      \,
                   /                                                           ,}
                 /                                                      ,:`^`  }
               /                                                   ,:”         /
              ?     __                                         :`           /
             /__ (     “~-,_                              ,:`          /
           /(_    ”~,_        “~,_                    ,:`        _/
          {  _$;_      ”=,_       “-,_       , -~-,}, ~”;/    }
           ((     *~_       ”=- _      “;,, /`    /”              /
   ,,,___ \`~,      “~ ,                    `     }              /
            (    `=-,,       `                        (      ;_,,-”
            / `~,      `-                               \      /\
             \`~ *-,                                     |, /     \,__
,,_          } >- _\                                   |              `=~-,
     `=~-,_\_      `\,                                 \
                   `=~-,, \,                               \
                                `:,,                           `\              __
                                     `=-,                   ,%`>--==``
                                        _\           _,-%       `\
                                   ,<`  _|_,-&``                `\
   */
  //free(ifKit);

  return INT2NUM(led_on);
}

void Init_phidget()
{
  Phidget = rb_define_module("Phidget");
  rb_define_singleton_method(Phidget, "toggle_led", method_toggle_led, 0);
}

