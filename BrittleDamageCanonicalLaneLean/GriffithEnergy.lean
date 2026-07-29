import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BrittleDamageCanonicalLaneLean

structure GriffithEnergyPackage where
  fractureEnergy : ℝ
  elasticEnergyRelease : ℝ
  energyBalance : Prop
  criticalStress : ℝ

structure GriffithEnergyEvidence (G : GriffithEnergyPackage) where
  energyBalanceClosed : G.energyBalance
  criticalStressPositive : G.criticalStress > 0

def GriffithEnergyClosed (G : GriffithEnergyPackage) : Prop :=
  G.energyBalance ∧ G.criticalStress > 0

theorem griffith_energy_closed_from_evidence (G : GriffithEnergyPackage) (E : GriffithEnergyEvidence G) :
    GriffithEnergyClosed G := by
  exact And.intro E.energyBalanceClosed E.criticalStressPositive

end BrittleDamageCanonicalLaneLean
end HautevilleHouse