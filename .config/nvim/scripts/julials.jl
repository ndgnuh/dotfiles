#!/bin/env -S julia -J /home/hung/system-images/nvim-lspconfig.sys.so

# Load LanguageServer.jl: attempt to load from ~/.julia/environments/nvim-lspconfig
# with the regular load path as a fallback
const ls_install_path = joinpath(
    get(DEPOT_PATH, 1, joinpath(homedir(), ".julia")),
    "environments", "nvim-lspconfig"
)
pushfirst!(LOAD_PATH, ls_install_path)
using LanguageServer
popfirst!(LOAD_PATH)
const depot_path = get(ENV, "JULIA_DEPOT_PATH", "")
const project_path = let
    dirname(something(
        ## 1. Finds an explicitly set project (JULIA_PROJECT)
        Base.load_path_expand((
            p = get(ENV, "JULIA_PROJECT", nothing);
            p === nothing ? nothing : isempty(p) ? nothing : p
        )),
        ## 2. Look for a Project.toml file in the current working directory,
        ##    or parent directories, with \$HOME as an upper boundary
        Base.current_project(),
        ## 3. First entry in the load path
        get(Base.load_path(), 1, nothing),
        ## 4. Fallback to default global environment,
        ##    this is more or less unreachable
        Base.load_path_expand("@v#.#"),
    ))
end
@info "Running language server" VERSION pwd() project_path depot_path
const server = LanguageServer.LanguageServerInstance(stdin, stdout, project_path, depot_path)
const server.runlinter = true
run(server)
