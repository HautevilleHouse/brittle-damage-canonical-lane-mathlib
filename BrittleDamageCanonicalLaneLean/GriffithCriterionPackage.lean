import BrittleDamageCanonicalLaneLean.BrittleDamageAdmissibleClass

namespace HautevilleHouse
namespace BrittleDamageCanonicalLaneLean

structure GriffithCriterionPackage where
  energyReleaseRate : Prop
  criticalEnergyReleaseRate : Prop
  crackPropagationCondition : Prop
  initialCrackSize : Prop

structure GriffithCriterionEvidence (G : GriffithCriterionPackage) where
  energyReleaseRateClosed : G.energyReleaseRate
  criticalEnergyReleaseRateClosed : G.criticalEnergyReleaseRate
  crackPropagationConditionClosed : G.crackPropagationCondition
  initialCrackSizeClosed : G.initialCrackSize

def GriffithCriterionClosed (G : GriffithCriterionPackage) : Prop :=
  G.energyReleaseRate ∧ G.criticalEnergyReleaseRate ∧
  G.crackPropagationCondition ∧ G.initialCrackSize

theorem griffith_criterion_closed_from_evidence
    (G : GriffithCriterionPackage) (E : GriffithCriterionEvidence G) :
    GriffithCriterionClosed G := by
  exact And.intro E.energyReleaseRateClosed
    (And.intro E.criticalEnergyReleaseRateClosed
      (And.intro E.crackPropagationConditionClosed E.initialCrackSizeClosed))

end BrittleDamageCanonicalLaneLean
end HautevilleHouse