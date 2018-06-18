namespace :question do

  desc "Populate DB with fake qustions"
  task seed: :environment do
    create_questions
    create_alternatives
  end

  private

    def create_questions
      @questions = []
      Question.age_groups.each do |age_group|
        20.times.with_index do |index|
          question = Question.new name: "Lollipops and Toothbrushes",
                                  difficulty: rand(1..3),
                                  age_group: age_group[0],
                                  explanation: "This is the explanation of the question number #{index+1}",
                                  title: "This is the title of the question",
                                  html: '<div class="exam__explanation"><p>The little beaver found a corridor full of lollipops and toothbrushes. He starts to walk along the corridor to eat lollipops and he cannot move backward.</p><p>The beaver can always brush his teeth when finding a brush. After eating two lollipops, he must brush his teeth before eating another lollipop.</p><p>In each step he can only eat the lollipop <strong>OR</strong> brush his teeth <strong>OR</strong> keep walking. He cannot take a lollipop or a toothbrush with him to the next step. <strong>How many lollipops can he eat at most while keeping his teeth healthy?</strong></p></div>'

          if question.valid?
            question.save
            @questions.append question
          else
            raise "Failed to create question #{question.errors.full_messages}"
          end
        end
      end
      puts "---> Created questions"
    end

    def create_alternatives
      alterntive_symbols = ["A", "B", "C", "D"]
      @questions.each do |question|
        4.times.each.with_index do |index|
          alternative = question.alternatives.new alternative_symbol: alterntive_symbols[index],
                                                  description: "test",
                                                  html_text: '<div class="exam__alternative">4</div>'

          if alternative.valid?
            alternative.save
          else
            raise "Alternative failed to create #{alternative.errors.full_messages}"
          end
        end
      end
      puts "---> Created alternatives"
    end

end