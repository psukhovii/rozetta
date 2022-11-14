# Execute from specific dir
rm -rf global_locals.tf  global_vars.tf provider.tf
ln -s ../../../global_locals.tf global_locals.tf
ln -s ../../../global_vars.tf global_vars.tf
if [[ $PWD == *"eu-west-1"* ]]; then
  sed "s/us-east-1/eu-west-1/g" ../../../provider.tf > provider.tf
else
  ln -s ../../../provider.tf provider.tf
fi