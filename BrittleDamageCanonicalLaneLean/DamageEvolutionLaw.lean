import BrittleDamageCanonicalLaneLean.FractureMechanicsPackage

namespace HautevilleHouse
namespace BrittleDamageCanonicalLaneLean

structure DamageEvolutionLawPackage {F : FractureMechanicsPackage} where
  damageVariable : Type u
  evolutionEquation : Prop
  loadingHistory : Prop
  crackGrowthCriterion : Prop
  irreversibilityCondition : Prop

structure DamageEvolutionLawEvidence {F : FractureMechanicsPackage}
    (D : DamageEvolutionLawPackage F) where
  evolutionEquationClosed : D.evolutionEquation
  loadingHistoryClosed : D.loadingHistory
  crackGrowthCriterionClosed : D.crackGrowthCriterion
  irreversibilityConditionClosed : D.irreversibilityCondition

def DamageEvolutionLawClosed {F : FractureMechanicsPackage}
    (D : DamageEvolutionLawPackage F) : Prop :=
  D.evolutionEquation ∧ D.loadingHistory ∧
  D.crackGrowthCriterion ∧ D.irreversibilityCondition

theorem damage_evolution_law_closed_from_evidence
    {F : FractureMechanicsPackage} (D : DamageEvolutionLawPackage F)
    (E : DamageEvolutionLawEvidence D) : DamageEvolutionLawClosed D := by
  exact And.intro E.evolutionEquationClosed
    (And.intro E.loadingHistoryClosed
      (And.intro E.crackGrowthCriterionClosed E.irreversibilityConditionClosed))

end BrittleDamageCanonicalLaneLean
end HautevilleHouse