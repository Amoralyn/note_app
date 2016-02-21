require_relative "note_app"

class StartApp
  def init
    puts "\n\n==============Welcome to The Note Application==============\n\n"
    author = get_string("Enter Author's name: ").capitalize 
    @note = Note::NotesApplication.new(author)

    show_options
    note_actions

  end

  def show_options
    puts "\n\nOPTIONS: \n\n" +
       "** To create a new note enter 'create' **\n" +
       "** To get a list of notes enter 'list' ** \n" +
       "** To get a particular note enter 'get' **\n" +
       "** To search for a text enter 'search' **\n" +
       "** To delete a note enter 'delete' **\n" +
       "** To edit an existing text enter 'edit' **\n" +
       "** To see Options again, enter 'Options' **\n" +
       "** To exit enter 'exit'\n\n"

  end

  def note_actions
    loop do
      user_input = gets.chomp.downcase

      case user_input
        when 'create' 
          note_content = get_string("Enter note content:")
          @note.create(note_content)
        when 'list'
          @note.list
        when 'get'
          note_id = get_string("Enter NOTE ID: ").to_i
          @note.get(note_id)
        when 'search'
          search_key = get_string("Enter search key: ")
          @note.search(search_key)
        when 'delete'
          note_id = get_string("Enter NOTE ID: ").to_i
          @note.delete(note_id)
        when 'edit'
          note_id = get_string("Enter NOTE ID: ").to_i
          new_content =  get_string("Enter new note content: ")
          @note.edit(note_id, new_content)
        when 'exit'
          break
        else
          show_options          
      end
    end
  end


  def get_string(prompt)
    result = nil
    loop do 
      puts prompt
      result = gets.chomp
      break if result.length > 0
    end

    result

  end 
end


StartApp.new.init