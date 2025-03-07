# MADHU: These are rocm-specific post-install steps to get pytorch
# working on rocm

# If you are on an hpcfund cluster with MI2xx, then
if [[ "$(uname -n)" == *"hpcfund" ]]; then
    # install packages from pytorch index
    # see https://rocm.docs.amd.com/projects/install-on-linux/en/latest/install/3rd-party/pytorch-install.html#using-a-wheels-package
    pip3 install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/rocm6.3
    # we really don't care about migraphx (it doesn't work)
else
    # install special index packages from rocm
    # see https://rocm.docs.amd.com/projects/radeon/en/latest/index.html
    # wget https://repo.radeon.com/rocm/manylinux/rocm-rel-6.3.2/torch-2.4.0%2Brocm6.3.2-cp310-cp310-linux_x86_64.whl
    # wget https://repo.radeon.com/rocm/manylinux/rocm-rel-6.3.2/torchvision-0.19.0%2Brocm6.3.2-cp310-cp310-linux_x86_64.whl
    # wget https://repo.radeon.com/rocm/manylinux/rocm-rel-6.3.2/pytorch_triton_rocm-3.0.0%2Brocm6.3.2.75cc27c26a-cp310-cp310-linux_x86_64.whl
    # wget https://repo.radeon.com/rocm/manylinux/rocm-rel-6.3.2/torchaudio-2.4.0%2Brocm6.3.2-cp310-cp310-linux_x86_64.whl

    pip3 uninstall torch torchvision pytorch-triton-rocm
    pip3 install torch-2.4.0+rocm6.3.2-cp310-cp310-linux_x86_64.whl torchvision-0.19.0+rocm6.3.2-cp310-cp310-linux_x86_64.whl torchaudio-2.4.0+rocm6.3.2-cp310-cp310-linux_x86_64.whl pytorch_triton_rocm-3.0.0+rocm6.3.2.75cc27c26a-cp310-cp310-linux_x86_64.whl

    # install onnx runtime
    # taken from https://rocm.docs.amd.com/projects/radeon/en/latest/docs/install/native_linux/install-onnx.html

    pip3 uninstall onnxruntime-rocm
    pip3 install onnxruntime-rocm -f https://repo.radeon.com/rocm/manylinux/rocm-rel-6.3.2/

fi
