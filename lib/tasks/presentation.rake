namespace :presentation do

  desc "Populate DB with fake data"
  task seed: :environment do
    create_deputy
    create_challenge
    create_competitors
    create_exams_and_questions
    create_alternatives
    create_durations
  end

  private

    def create_deputy
      @deputy = Deputy.create name: "Jane", email: "jane@gmail.com", phone: "067981120075", password: "secret123"
      @deputy = Deputy.create name: "Amaury", email: "amaury@gmail.com", phone: "067981120075", password: "secret123"
      @deputy = Deputy.create name: "Renan", email: "renan@gmail.com", phone: "067981120075", password: "secret123"
      puts "---> Created deputy"
    end

    def create_challenge
      Deputy.all.each.with_index do |deputy, index|
        4.times.with_index do |inner_index|
          CreateChallengeService.call start_date: DateTime.now+index, name: "Bebras 2018 Turma #{index} - #{inner_index}", deputy: deputy
        end
      end
      puts "---> Created challenges"
    end

    def create_competitors
      @competitors = []
      Challenge.all.each.with_index do |challenge, index|
        @competitors.append(challenge.competitors.create name: "Jonathan #{index}", email: "jonathan#{index}@gmail.com", password: "secret123")
        @competitors.append(challenge.competitors.create name: "Bruno #{index}", email: "bruno#{index}@gmail.com", password: "secret123")
        @competitors.append(challenge.competitors.create name: "Victor #{index}", email: "victor#{index}@gmail.com", password: "secret123")
        @competitors.append(challenge.competitors.create name: "Kramer #{index}", email: "kramer#{index}@gmail.com", password: "secret123")
        puts "---> Created competitor"
      end
    end

    def create_exams_and_questions
      @competitors.each do |competitor|
        exam = competitor.build_exam
        15.times.with_index do |index|
          question = exam.questions.new name: "Lollipops and Toothbrushes", difficulty: rand(1..3), age_group: rand(1..3), explanation: "This is the explanation of the question number #{index+1}", title: "This is the title of the question", html: '<div class="exam__explanation"><p>The little beaver found a corridor full of lollipops and toothbrushes. He starts to walk along the corridor to eat lollipops and he cannot move backward.</p><p>The beaver can always brush his teeth when finding a brush. After eating two lollipops, he must brush his teeth before eating another lollipop.</p><p>In each step he can only eat the lollipop <strong>OR</strong> brush his teeth <strong>OR</strong> keep walking. He cannot take a lollipop or a toothbrush with him to the next step. <strong>How many lollipops can he eat at most while keeping his teeth healthy?</strong></p></div>'
          if question.valid?
            question.save
          else
            raise "Question index+1: #{index+1} is invalid"
          end
        end

        exam.save
      end
      puts "---> Created exams and questions"
    end

    def create_alternatives
      alterntive_symbols = ["A", "B", "C", "D"]
      @competitors.each do |competitor|
        questions = competitor.exam.questions
        questions.each do |question|
          4.times.with_index do |index|
            alternative = question.alternatives.new alternative_symbol: alterntive_symbols[index], description: "test", html_text: '<div class="exam__alternative">4</div>'
            if alternative.valid?
              alternative.save
            else
              raise "Alternative failed"
            end
          end
        end
      end
      puts "---> Created alternatives"
    end

    def create_durations
      ExamDuration.create exam_duration_in_minutes: 45
    end
end

