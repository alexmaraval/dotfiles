if [ -f "$HOME/.bash_aliases" ]; then
    . "$HOME/.bash_aliases"
fi

# Keep cache paths portable across machines.
export HF_HOME="${HF_HOME:-$HOME/.cache/huggingface}"

# Restrict over-eager numerical libraries by default.
export OMP_NUM_THREADS="${OMP_NUM_THREADS:-1}"
export MKL_NUM_THREADS="${MKL_NUM_THREADS:-1}"
export GOTO_NUM_THREADS="${GOTO_NUM_THREADS:-1}"
export RCALL_NUM_CPU="${RCALL_NUM_CPU:-1}"

# Make breakpoint() open pdb unless a project overrides it.
export PYTHONBREAKPOINT="${PYTHONBREAKPOINT:-pdb.set_trace}"

# Enable conda when it is installed in a common location.
for conda_sh in \
    "$HOME/miniconda3/etc/profile.d/conda.sh" \
    "$HOME/miniforge3/etc/profile.d/conda.sh" \
    "$HOME/anaconda3/etc/profile.d/conda.sh"
do
    if [ -f "$conda_sh" ]; then
        . "$conda_sh"
        break
    fi
done

if [ -f "$HOME/.local/bin/env" ]; then
    . "$HOME/.local/bin/env"
fi

# Keep tokens, private paths, and machine-specific exports out of git.
if [ -f "$HOME/.bashrc.local" ]; then
    . "$HOME/.bashrc.local"
fi
