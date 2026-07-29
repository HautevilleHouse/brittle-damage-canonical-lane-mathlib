import BrittleDamageCanonicalLaneLean.DamageEvolutionLaw

namespace HautevilleHouse
namespace BrittleDamageCanonicalLaneLean

structure MicrocrackPropagationPackage {F : FractureMechanicsPackage}
    (D : DamageEvolutionLawPackage F) where
  microcrackDensity : Prop
  coalescenceThreshold : Prop
  localizationBand : Prop
  macrocrackFormation : Prop

structure MicrocrackPropagationEvidence {F : FractureMechanicsPackage}
    {D : DamageEvolutionLawPackage F}
    (M : MicrocrackPropagationPackage D) where
  microcrackDensityClosed : M.microcrackDensity
  coalescenceThresholdClosed : M.coalescenceThreshold
  localizationBandClosed : M.localizationBand
  macrocrackFormationClosed : M.macrocrackFormation

def MicrocrackPropagationClosed {F : FractureMechanicsPackage}
    {D : DamageEvolutionLawPackage F}
    (M : MicrocrackPropagationPackage D) : Prop :=
  M.microcrackDensity ∧ M.coalescenceThreshold ∧
  M.localizationBand ∧ M.macrocrackFormation

theorem microcrack_propagation_closed_from_evidence
    {F : FractureMechanicsPackage} {D : DamageEvolutionLawPackage F}
    (M : MicrocrackPropagationPackage D)
    (E : MicrocrackPropagationEvidence M) : MicrocrackPropagationClosed M := by
  exact And.intro E.microcrackDensityClosed
    (And.intro E.coalescenceThresholdClosed
      (And.intro E.localizationBandClosed E.macrocrackFormationClosed))

end BrittleDamageCanonicalLaneLean
end HautevilleHouse