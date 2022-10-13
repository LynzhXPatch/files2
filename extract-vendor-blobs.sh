HOME=/home/work/ubUwUntu/ubUwUntu
dumpdir=$HOME/dump

pip install protobuf==3.20.*
pip install launchpadlib
git clone https://github.com/vm03/payload_dumper
wget https://bigota.d.miui.com/V13.0.7.0.SKWEUXM/miui_AGATEEEAGlobal_V13.0.7.0.SKWEUXM_1a664530b8_12.0.zip
unzip miui_AGATEEEAGlobal_V13.0.7.0.SKWEUXM_1a664530b8_12.0.zip
cd payload_dumper && pip install -r requirements.txt
mv $HOME/payload.bin $HOME/payload_dumper
python3 payload_dumper.py payload.bin
mkdir $HOME/dump
mv $HOME/payload_dumper/ouput/system.img $HOME/dump
mv $HOME/payload_dumper/ouput/system_ext.img $HOME/dump
mv $HOME/payload_dumper/ouput/vendor.img $HOME/dump
cd $HOME/dump && 7z x system.img -y -osystem && 7z x system_ext.img -y -osystem_ext && 7z x vendor.img -y -ovendor
mv $dumpdir/system/system $HOME && rm -rf $dumpdir/system && mv $HOME/system $dumpdir
rm -rf $dumpdir/system.img && rm -rf $dumpdir/system_ext.img && rm -rf $dumpdir/vendor.img
cd $HOME && wget https://github.com/LynzhXPatch/files2/raw/main/proprietary-files.txt && wget https://github.com/LynzhXPatch/files2/raw/main/extract-files.sh && wget https://github.com/LynzhXPatch/files2/raw/main/setup-makefiles.sh