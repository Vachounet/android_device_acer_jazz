#!/system/bin/sh
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NON-INFRINGEMENT ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

target=`getprop ro.product.device`
case "$target" in
    "msm7630_surf" | "a5")
        insmod /system/lib/modules/ss_mfcinit.ko
        insmod /system/lib/modules/ss_vencoder.ko
        insmod /system/lib/modules/ss_vdecoder.ko
        chmod 0666 /dev/ss_mfc_reg
        chmod 0666 /dev/ss_vdec
        chmod 0666 /dev/ss_venc


# Dynamic Memory Managment (DMM) provides a sys file system to the userspace
# that can be used to plug in/out memory that has been configured as unstable.
# This unstable memory can be in Active or In-Active State.
# Each of which the userspace can request by writing to a sys file.

# ro.dev.dmm = 1; Indicates that DMM is enabled in the Android User Space. This
# property is set in the Android system properties file.

# ro.dev.dmm.dpd.start_address is set when the target has a 2x256Mb memory
# configuration. This is also used to indicate that the target is capable of
# setting EBI-1 to Deep Power Down or Self Refresh.

        mem="/sys/devices/system/memory"
        op=`cat $mem/movable_start_bytes`
        case "$op" in
           "0" )
                log -p i -t DMM DMM Disabled. movable_start_bytes not set: $op
            ;;

            "$mem/movable_start_bytes: No such file or directory " )
                log -p i -t DMM DMM Disabled. movable_start_bytes does not exist: $op
            ;;

            * )
                log -p i -t DMM DMM available. movable_start_bytes at $op
                movable_start_bytes=0x`cat $mem/movable_start_bytes`
                block_size_bytes=0x`cat $mem/block_size_bytes`
                block=$(($movable_start_bytes/$block_size_bytes))

                echo $movable_start_bytes > $mem/probe
                case "$?" in
                    "0" )
                        log -p i -t DMM $movable_start_bytes to physical hotplug succeeded.
                    ;;
                    * )
                        log -p e -t DMM $movable_start_bytes to physical hotplug failed.
                        return 1
                    ;;
                esac

               chown system system $mem/memory$block/state

                echo online > $mem/memory$block/state
                case "$?" in
                    "0" )
                        log -p i -t DMM \'echo online\' to logical hotplug succeeded.
                    ;;
                    * )
                        log -p e -t DMM \'echo online\' to logical hotplug failed.
                        return 1
                    ;;
                esac

                setprop ro.dev.dmm.dpd.start_address $movable_start_bytes
                setprop ro.dev.dmm.dpd.block $block
            ;;
        esac

        op=`cat $mem/low_power_memory_start_bytes`
        case "$op" in
            "0" )
                log -p i -t DMM Self-Refresh-Only Disabled. low_power_memory_start_bytes not set:$op
            ;;

            "$mem/low_power_memory_start_bytes No such file or directory " )
                log -p i -t DMM Self-Refresh-Only Disabled. low_power_memory_start_bytes does not exist:$op
            ;;

            * )
                log -p i -t DMM Self-Refresh-Only available. low_power_memory_start_bytes at $op
            ;;
        esac
        ;;

        /system/bin/sh /system/etc/init.qcom.load-modem.sh
        ;;
esac
