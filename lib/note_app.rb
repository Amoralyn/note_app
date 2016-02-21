module Note

    class NotesApplication
        def initialize(author)
            @author = author
            @notes = []
        end
        def create(notes_content)
            @notes.push(notes_content)
        end
        
        def list
            @notes.each do |i|
               puts "NOTE ID : #{@notes.index(i)+1}\n\n#{i}\n\nBy Author: #{@author}\n\n===============================\n\n"
           end
        end 
        def get(note_id)
            if note_id < 1 || note_id > @notes.length
                puts "Invalid ID: #{note_id}\n\n"
            else
                puts @notes[note_id - 1]
            end
        end
        
        def search(search_text)
            puts "Showing results for search '#{search_text}':\n\n"
            @notes.each do |i|
                if i.include? search_text
                    puts "NOTE ID : #{@notes.index(i)+1}\n\n#{i}\n\nBy Author: #{@author}\n\n===============================\n\n"
                
                else
                    puts "No result found"
                    break
                end
                
            end
            
        end
    end
end