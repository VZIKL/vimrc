#!/bin/bash
cd ~/.vim/pack/plugin/opt
ls | xargs -I{} git -C {} pull
echo "Success Update"
