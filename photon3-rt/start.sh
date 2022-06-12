sudo docker run --net=host -it --rm \
-v $(pwd)/vsphere.json:/home/imagebuilder/vsphere.json \
-v $(pwd)/tkg.json:/home/imagebuilder/tkg.json \
-v $(pwd)/tkg:/home/imagebuilder/tkg \
-v $(pwd)/goss/vsphere-photon-1.22.5+vmware.1-tkg-v1.5.2-goss-spec.yaml:/home/imagebuilder/goss/goss.yaml \
-v $(pwd)/photon-3.json:/home/imagebuilder/packer/ova/photon-3.json \
-v $(pwd)/ks.json:/home/imagebuilder/packer/ova/linux/photon/http/3/ks.json \
-v $(pwd)/metadata.json:/home/imagebuilder/metadata.json \
-v $(pwd)/output:/home/imagebuilder/output \
--env PACKER_VAR_FILES="tkg.json vsphere.json" \
--env OVF_CUSTOM_PROPERTIES=/home/imagebuilder/metadata.json \
projects.registry.vmware.com/tkg/imagebuilder-byoi:v0.1.9 \
build-node-ova-vsphere-photon-3
