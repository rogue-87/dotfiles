function binsln --description "creates a symlink for a executable in ~/.local/bin"
    # Check if an argument is provided
    if test (count $argv) -ne 1
        echo "Usage: link_to_local_bin <file_or_executable>"
        return 1
    end

    # Get the target file or executable
    set target (realpath $argv[1])

    # Generate the symlink path
    set link_name ~/.local/bin/(basename $target)

    # Create the symbolic link
    ln -s $target $link_name

    echo "Created symlink: $link_name -> $target"
end
