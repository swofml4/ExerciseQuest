class WorkoutsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_workout, only: [:show, :edit, :update, :destroy]


  # GET /workouts
  # GET /workouts.json
  def index
    @workouts = Workout.where(user_id: current_user.id).reverse_order
  end

  # GET /workouts/1
  # GET /workouts/1.json
  def show
  end

  # GET /workouts/new
  def new
    @workout = Workout.new(user_id: current_user)
    @exercises = Exercise.all
  end

  # GET /workouts/1/edit
  def edit
  end

  # POST /workouts
  # POST /workouts.json
  def create
    @workout_temp = Workout.new(workout_params)
    @workout_temp.user_id = current_user.id
    @workout_lookups = Workout.where("created_at >= ? and user_id = ? and exercise_id = ?", DateTime.now - 1.minutes, @workout_temp.user_id, @workout_temp.exercise_id)
    if @workout_lookups.empty?
      @workout = @workout_temp
    else
      @workout_lookup = @workout_lookups.first
      @workout_lookup.reps = @workout_lookup.reps + @workout_temp.reps
      @workout = @workout_lookup
    end
    respond_to do |format|
      if @workout.save
        #update the player stats
        @workout.exercise.bodyparts.each do |bodypart|
          tmpstat = current_user.user_stats.where('bodypart_id = ?', bodypart.id).first
          tmpstat.base_points = tmpstat.base_points + @workout_temp.reps
          tmpstat.level_points = Math.sqrt(tmpstat.base_points).round(1)
          tmpstat.save
        end
        format.html { redirect_to new_workout_path, notice: 'Added ' + @workout.exercise.name + ' +' + @workout.reps.to_s }
        format.json { render :show, status: :created, location: @workout }
      else
        format.html { render :new }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workouts/1
  # PATCH/PUT /workouts/1.json
  def update
    respond_to do |format|
      if @workout.update(workout_params)
        format.html { redirect_to @workout, notice: 'Workout was successfully updated.' }
        format.json { render :show, status: :ok, location: @workout }
      else
        format.html { render :edit }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workouts/1
  # DELETE /workouts/1.json
  def destroy
    @workout.destroy
    respond_to do |format|
      format.html { redirect_to workouts_url, notice: 'Workout was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout
      @workout = Workout.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workout_params
      params.require(:workout).permit(:exercise_id, :reps)
    end
end
