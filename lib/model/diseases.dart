class Disease {
  String first_day;
  double bmi;
  int weeks_pregnant;
  bool fatigue = false;
  double one_hour_plasma_glucose_level;
  bool gestational_diabetes_history = false;
  int systolic_blood_pressure;
  int diastolic_blood_pressure;
  double haemoglobin_level;
  double calcium_level;
  double phosphate_level;
  double urine_protein_level;
  double blood_creatinine_level;
  double blood_urea_nitrogen_level;
  double vitamin_c_level;
  bool gingivitis = false;
  double ldlc_level;
  double hdlc_level;
  bool family_history_heart_disease = false;
  bool chest_pain = false;
  bool blurred_vision = false;
  bool floating_spots = false;
  bool obesity = false;
  bool gestational_diabetes = false;
  bool hypertension = false;
  bool anaemia = false;
  bool rickets = false;
  bool kidney_diseases = false;
  bool scurvy = false;
  bool heart_disease = false;
  bool eye_disease = false;

  Disease({
    required this.first_day,
    required this.bmi,
    required this.weeks_pregnant,
    required this.fatigue,
    required this.one_hour_plasma_glucose_level,
    required this.gestational_diabetes_history,
    required this.systolic_blood_pressure,
    required this.diastolic_blood_pressure,
    required this.haemoglobin_level,
    required this.calcium_level,
    required this.phosphate_level,
    required this.urine_protein_level,
    required this.blood_creatinine_level,
    required this.blood_urea_nitrogen_level,
    required this.vitamin_c_level,
    required this.gingivitis,
    required this.ldlc_level,
    required this.hdlc_level,
    required this.family_history_heart_disease,
    required this.chest_pain,
    required this.blurred_vision,
    required this.floating_spots,
    required this.obesity,
    required this.gestational_diabetes,
    required this.hypertension,
    required this.anaemia,
    required this.rickets,
    required this.kidney_diseases,
    required this.scurvy,
    required this.heart_disease,
    required this.eye_disease,
  });

  Map<String, dynamic> toJson() {
    return {
      'first_day': first_day,
      'bmi': bmi,
      'weeks_pregnant': weeks_pregnant,
      'fatigue': fatigue,
      'one_hour_plasma_glucose_level': one_hour_plasma_glucose_level,
      'gestational_diabetes_history': gestational_diabetes_history,
      'systolic_blood_pressure': systolic_blood_pressure,
      'diastolic_blood_pressure': diastolic_blood_pressure,
      'haemoglobin_level': haemoglobin_level,
      'calcium_level': calcium_level,
      'phosphate_level': phosphate_level,
      'urine_protein_level': urine_protein_level,
      'blood_creatinine_level': blood_creatinine_level,
      'blood_urea_nitrogen_level': blood_urea_nitrogen_level,
      'vitamin_c_level': vitamin_c_level,
      'gingivitis': gingivitis,
      'ldlc_level': ldlc_level,
      'hdlc_level': hdlc_level,
      'family_history_heart_disease': family_history_heart_disease,
      'chest_pain': chest_pain,
      'blurred_vision': blurred_vision,
      'floating_spots': floating_spots,
      'obesity': obesity,
      'gestational_diabetes': gestational_diabetes,
      'hypertension': hypertension,
      'anaemia': anaemia,
      'rickets': rickets,
      'kidney_diseases': kidney_diseases,
      'scurvy': scurvy,
      'heart_disease': heart_disease,
      'eye_disease': eye_disease,
    };
  }
}
