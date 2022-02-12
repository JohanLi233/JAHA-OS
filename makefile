build/%.bin: src/%.asm
	nasm $< -o $@

build/master.img: build/boot.bin build/loader.bin
	yes | bximage -q -hd=16 -func=create -sectsize=512 -imgmode=flat $@
	dd if=build/boot.bin of=$@ bs=512 count=1 conv=notrunc
	dd if=build/loader.bin of=$@ bs=512 count=4 seek=2 conv=notrunc

.PHONY: usb
usb: boot.bin /dev/sdb
	sudo dd if=/dev/sdb of=tmp.bin bs=512 count=1 conv=notrunc
	cp tmp.bin usb.bin
	sudo rm tmp.bin
	dd if=boot.bin of=usb.bin bs=446 count=1 conv=notrunc
	sudo dd if=usb.bin of=/dev/sdb bs=512 count=1 conv=notrunc
	rm usb.bin

.PHONY:bochs
bochs: build/master.img
	rm -rf build/bx_enh_dbg.ini
	cd build && bochs -q -unlock

.PHONY:clean
clean:
	rm -rf build/bx_enh_dbg.ini
	rm -rf build/master.img
	rm -rf build/*.bin
	rm -rf build/*.o
