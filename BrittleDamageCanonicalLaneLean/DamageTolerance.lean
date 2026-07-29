import BrittleDamageCanonicalLaneLean.CrackPropagation

namespace HautevilleHouse
namespace BrittleDamageCanonicalLaneLean

structure DamageTolerancePackage {F : FractureCriterionPackage}
    (C : CrackPropagationPackage F) where
  toleranceThreshold : ℝ
  residualStrength : ℝ
  inspectionInterval : ℝ
  damageToleranceSatisfied : Prop

structure DamageToleranceEvidence {F : FractureCriterionPackage}
    {C : CrackPropagationPackage F} (D : DamageTolerancePackage C) where
  toleranceThresholdClosed : D.toleranceThreshold > 0
  residualStrengthClosed : D.residualStrength > 0
  inspectionIntervalClosed : D.inspectionInterval > 0
  damageToleranceSatisfiedClosed : D.damageToleranceSatisfied

def DamageToleranceClosed {F : FractureCriterionPackage}
    {C : CrackPropagationPackage F} (D : DamageTolerancePackage C) : Prop :=
  D.toleranceThreshold > 0 ∧ D.residualStrength > 0 ∧
  D.inspectionInterval > 0 ∧ D.damageToleranceSatisfied

theorem damage_tolerance_closed_from_evidence
    {F : FractureCriterionPackage} {C : CrackPropagationPackage F}
    (D : DamageTolerancePackage C) (E : DamageToleranceEvidence D) :
    DamageToleranceClosed D := by
  exact And.intro E.toleranceThresholdClosed
    (And.intro E.residualStrengthClosed
      (And.intro E.inspectionIntervalClosed E.damageToleranceSatisfiedClosed))

end BrittleDamageCanonicalLaneLean
end HautevilleHouse