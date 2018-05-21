namespace :exam do

  desc "Populate DB with fake data"
  task seed: :environment do
    create_durations
    create_deputy
    create_challenge
    create_competitors
    create_question_and_alternative
    setup_exam
  end

  desc "create_competitors"
  task create_competitors: :environment do
    create_competitors
  end

  desc "create_question_and_alternative"
  task create_question_and_alternative: :environment do
    create_question_and_alternative
  end

  desc "setup_exam"
  task setup_exam: :environment do
    setup_exam
  end

  private

    def create_deputy
      @deputy = Deputy.create name: "Renan", email: "renan@gmail.com", phone: "067981120075", password: "secret123"
      @deputy = Deputy.create name: "Victor", email: "victor@gmail.com", phone: "067981120075", password: "secret123"
      @deputy = Deputy.create name: "Kramer", email: "kramer@gmail.com", phone: "067981120075", password: "secret123"
      puts "---> Created deputy"
    end

    def create_challenge
      Deputy.all.each.with_index do |deputy, index|
        3.times.with_index do |inner_index|
          deputy.challenges.create start_date: DateTime.now+index, name: "Bebras 2018 Turma #{index} - #{inner_index}"
        end
      end
      puts "---> Created challenges"
    end

    def create_competitors
      Challenge.all.each do |challenge|
        challenge.competitors.create name: "Jonathan", email: "jonathan@gmail.com", password: "secret123", generated_password: "secret123", age: 17
        challenge.competitors.create name: "Bruno", email: "bruno@gmail.com", password: "secret123", generated_password: "secret123", age: 17
        challenge.competitors.create name: "Victor", email: "victor@gmail.com", password: "secret123", generated_password: "secret123", age: 17
        challenge.competitors.create name: "Kramer", email: "kramer@gmail.com", password: "secret123", generated_password: "secret123", age: 17
        puts "---> Created competitor"
      end
    end

    def create_question_and_alternative
      alterntive_symbols = ["A", "B", "C", "D"]
      60.times.with_index do |index|
        question = Question.new name: "Lollipops and Toothbrushes", difficulty: rand(1..3), age_group: rand(1..3), explanation: "This is the explanation of the question number #{index+1}", title: "This is the title of the question", html: '<div class="exam__explanation"><p>The little beaver found a corridor full of lollipops and toothbrushes. He starts to walk along the corridor to eat lollipops and he cannot move backward.</p><p>The beaver can always brush his teeth when finding a brush. After eating two lollipops, he must brush his teeth before eating another lollipop.</p><p>In each step he can only eat the lollipop <strong>OR</strong> brush his teeth <strong>OR</strong> keep walking. He cannot take a lollipop or a toothbrush with him to the next step. <strong>How many lollipops can he eat at most while keeping his teeth healthy?</strong></p></div>'
        4.times.with_index do |inner_index|
          question.alternatives.new alternative_symbol: alterntive_symbols[inner_index], description: "test", html_text: '<div class="exam__alternative">4</div>'
        end
        if question.valid?
          question.save
        else
          raise "Question error #{question.errors}"
        end
      end
      puts "---> Created questions and alternatives"
    end

    def setup_exam
      @competitors = Competitor.all
      @competitors.each do |competitor|
        questions = Question.order("RAND()").limit(15)
        exam = competitor.build_exam
        exam.questions = questions
        if exam.valid?
          exam.save
        else
          raise "Setup error #{competitor.errors}"
        end
      end
      puts "---> Random questions to competitor"
    end

    def create_durations
      ExamDuration.create exam_duration_in_minutes: 45
    end
end

