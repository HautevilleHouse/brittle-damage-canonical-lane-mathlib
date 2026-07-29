import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BrittleDamageCanonicalLaneLean.BrittleDamageObject

namespace HautevilleHouse
namespace BrittleDamageCanonicalLaneLean

structure CrackPropagationModel (O : BrittleDamageObject) where
  stressIntensityFactor : Prop
  parisLaw : Prop
  thresholdStress : Prop
  crackGrowthRate : Prop
  propagationStability : Prop

structure CrackPropagationEvidence (O : BrittleDamageObject) (M : CrackPropagationModel O) where
  stressIntensityFactorClosed : M.stressIntensityFactor
  parisLawClosed : M.parisLaw
  thresholdStressClosed : M.thresholdStress
  crackGrowthRateClosed : M.crackGrowthRate
  propagationStabilityClosed : M.propagationStability

def CrackPropagationClosed (O : BrittleDamageObject) (M : CrackPropagationModel O) : Prop :=
  M.stressIntensityFactor ∧ M.parisLaw ∧ M.thresholdStress ∧ M.crackGrowthRate ∧ M.propagationStability

theorem crack_propagation_closed_from_evidence (O : BrittleDamageObject) (M : CrackPropagationModel O) (E : CrackPropagationEvidence O M) :
    CrackPropagationClosed O M := by
  exact And.intro E.stressIntensityFactorClosed
    (And.intro E.parisLawClosed
      (And.intro E.thresholdStressClosed
        (And.intro E.crackGrowthRateClosed E.propagationStabilityClosed)))

end BrittleDamageCanonicalLaneLean
end HautevilleHouse