import HautevilleHouse.BrittleDamageCanonicalLaneLean.LinearElasticFracture

namespace HautevilleHouse
namespace BrittleDamageCanonicalLaneLean

structure EnergyReleasePackage where
  Gc : ℝ
  GIc : ℝ
  crackExtensionCriterion : Prop
  stabilityCondition : Prop

structure EnergyReleaseEvidence (E : EnergyReleasePackage) where
  GcClosed : E.Gc > 0
  GIcClosed : E.GIc > 0
  crackExtensionCriterionClosed : E.crackExtensionCriterion
  stabilityConditionClosed : E.stabilityCondition

def EnergyReleaseClosed (E : EnergyReleasePackage) : Prop :=
  E.Gc > 0 ∧ E.GIc > 0 ∧ E.crackExtensionCriterion ∧ E.stabilityCondition

theorem energy_release_closed_from_evidence (E : EnergyReleasePackage)
    (Ev : EnergyReleaseEvidence E) : EnergyReleaseClosed E := by
  exact And.intro Ev.GcClosed (And.intro Ev.GIcClosed
    (And.intro Ev.crackExtensionCriterionClosed Ev.stabilityConditionClosed))

end BrittleDamageCanonicalLaneLean
end HautevilleHouse