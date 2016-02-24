module Note

    class NotesApplication
        def initialize(author)
            @author = author
            @notes = []
        end


        def create(notes_content)
            @notes.push(notes_content)
            puts "Note has been created!\n\n"
        end
        
        def list
        	if @notes.empty? 
        		puts "No notes available\n\n"
        	end

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
            puts "No notes to search through" if @notes.empty?
            @notes.each do |i|
                 puts "Showing results for search '#{search_text}':\n\n"
                if i.include? search_text
                    puts "NOTE ID : #{@notes.index(i)+1}\n\n#{i}\n\nBy Author: #{@author}\n\n===============================\n\n"
                else
                    puts "No result found\n\n"
                    break
                end
                
            end
            
        end

         def delete(note_id)
            puts "No notes to search through" if @notes.empty?
            if note_id < 1 || note_id > @notes.length
                puts "Invalid ID: #{note_id}\n\n"
            else
                @notes.delete_at(note_id - 1)
                puts "Note with ID #{note_id} has been deleted\n\n"
            end
        end
        
        def edit(note_id,new_content)
            if note_id < 1 || note_id > @notes.length
                puts "Invalid ID: #{note_id}" 
            else
                @notes[(note_id - 1)] = new_content
                puts "Your note with NOTE ID : #{note_id}, has been changed to #{new_content}" 
            end
        end
        
    end
end