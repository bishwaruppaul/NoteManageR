# Asking user for choice - whether to create a new file or open existing
writeLines("\nType 'c' to see the tags and create a new note
Type 'o' see the tags and open an existing note: ")
choice <- readLines("stdin", n = 1)

# Get list of all notes in the directory
setwd("notes/")
all_notes <- list.files(pattern = "\\.txt$")

# Empty vector for storing tags from the notes
tag_list <- character()

# Get all tags into the vector
for (i in all_notes) {
    # Open a note, read tag line, and close
    tag_line <- readLines(i, n = 1)

    # Separate tags from string, and store in vector
    tags_from_line <- unlist(strsplit(tag_line, " "))[-1]
    tag_list <- append(tag_list, tags_from_line)
}

# Create a vector of unique tags and display to output
all_tags <- unique(tag_list)

if (choice == "o") {
    # Display tags
    writeLines("\nList of tags in existing notes: ")
    cat(paste(all_tags), sep = "\t")

    repeat {
        # Ask user to select a tag
        writeLines("\n\nEnter a tag: ")
        select_tag <- readLines("stdin", n = 1)

        # Check whether the tag is correct, else ask to enter again
        if (select_tag %in% all_tags) {
            break
        } else {
            writeLines("\nYou have entered an incorrect/misspelt tag.")
        }
    }

    # Vector for storing note names with selected tag present
    note_with_tag <- character()

    # Get names of all the notes containing the tag
    for (i in all_notes) {
        if (length(grep(select_tag, readLines(i, n = 1))) == TRUE) {
            note_name <- unlist(strsplit(i, "\\."))[1]
            note_with_tag <- append(note_with_tag, note_name)
        }
    }

    # Put notes with tag in a dataframe for selection by user
    note_df <- as.data.frame(cbind(1:length(note_with_tag), note_with_tag))
    colnames(note_df) <- c("ID", "Filename")

    # Display the notes with the selected tag present
    writeLines("\nNotes containing the tag:\n")
    print(note_df, row.names = FALSE)

    # Ask user to select a note
    writeLines("\nEnter the ID of the note to open: ")
    select_note_id <- as.integer(readLines("stdin", n = 1))
    select_note <- note_df$Filename[note_df$ID == select_note_id]

    # Open the note
    select_note_name <- paste0(select_note, ".txt")
    shell.exec(select_note_name)

} else if (choice == "c") {
    # Display tags
    writeLines("\nList of tags in existing notes: ")
    cat(paste(all_tags), sep = "\t")

    # Ask for tags
    writeLines("\n\nEnter tag(s) for new note, separated by space: ")
    tag <- readLines("stdin", n = 1)

    # Ask for file name
    writeLines("\nEnter file name for new note: ")
    file_name <- readLines("stdin", n = 1)

    # Create a new plain text file
    created_file <- paste0(file_name, ".txt")
    file.create(created_file)

    # Write tags, date-time
    writeLines(paste0("Tags: ", tag, "\nCreated: ",
        format(Sys.time(), "%d %b %Y, %I:%M %p")), created_file)

    # Open the note in system text editor
    shell.exec(created_file)
}
