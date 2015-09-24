# At OpenWRT build root
pushd package
git clone https://github.com/jingpg/dashuazi.git
popd

# Enable dashuazi in network category 
make menuconfig

# Optional
make -j

# Build the package
make V=99 package/dashuazi/compile
