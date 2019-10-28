class ScoresController < ApplicationController
  before_action :set_score, only: [:show, :edit, :update, :destroy]

  # GET /scores
  # GET /scores.json
  def index
    @scores = Score.all
  end

  # GET /scores/1
  # GET /scores/1.json
  def show
  end

  # GET /scores/new
  def new
    @score = Score.new
  end

  # GET /scores/1/edit
  def edit
  end

  # POST /scores
  # POST /scores.json
  def create

    @score_params1 = processing(score_params)
    @score = Score.new(@score_params1)

    respond_to do |format|
      if @score.save
        format.html { redirect_to @score, notice: 'Score was successfully created.' }
        format.json { render :show, status: :created, location: @score }
      else
        format.html { render :new }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scores/1
  # PATCH/PUT /scores/1.json
  def update
    respond_to do |format|
      if @score.update(score_params)
        format.html { redirect_to @score, notice: 'Score was successfully updated.' }
        format.json { render :show, status: :ok, location: @score }
      else
        format.html { render :edit }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scores/1
  # DELETE /scores/1.json
  def destroy
    @score.destroy
    respond_to do |format|
      format.html { redirect_to scores_url, notice: 'Score was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_score
      @score = Score.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def score_params
      params.require(:score).permit(:frame_1, :frame_2, :frame_3, :frame_4, :frame_5, :frame_6, :frame_7, :frame_8, :frame_9, :frame_10, :total)
    end

    # App produce the total score for the game 
    # @strike = "X"
    # @spare  = "5/"
    # @miss   = "9-"    
    def processing(params)

      @frames = params.to_h
      @frames = @frames.to_a

      @score  = 0 

      @frames.each_with_index do |value, key|
        
        # strike  
        if value[1] == "X"   
              
          @frames[key+1..key+2].each_with_index do |value1, key1| 

            # strike 
            if value1[1] == "X"   
              @score += 10
            end      

            # spare
            if value1[1].include? "/"
              @score_value1 = value1[1].split(//)
              @score += @score_value1[0].to_i
            end

          end

          if key == 8 
            @score += 10
          end

          if key == 9 
            @score += 20
          end
          
          @score += 10
          
        end

        # spare 
        if value[1].include? "/"
          @score_value = value[1].split(//)
          @score += @score_value[0].to_i + 10
        end

        # miss
        if value[1].include? "-"
          @score_value = value[1].split(//)
          @score += @score_value[0].to_i
        end

        @frames[key][1] << " =  #{@score} "

      end
      
      @frames << ["total", @score]

      p @frames
      p "Total => #{@score}"  
      p ""      
      
      return @frames.to_h

    end
end
