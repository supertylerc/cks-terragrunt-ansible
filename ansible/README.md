Use `pipenv` to setup environment:

```bash
$ pipenv install
```

Get the output from the Terragrunt and save it in this folder as `inventory`.

Run the following command, assuming your SSH private key that was added is at `~/.ssh/id_do_cks`:

```bash
$ pipenv run provision ~/.ssh/id_do_cks
```

No warranty.  Use at your own risk.
