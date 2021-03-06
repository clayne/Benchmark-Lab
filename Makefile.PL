use strict;
use warnings;

use 5.008001;

use ExtUtils::MakeMaker 6.17;

my %WriteMakefileArgs = (
  "ABSTRACT" => "Tools for structured benchmarking and profiling",
  "AUTHOR" => "David Golden <dagolden\@cpan.org>",
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.17"
  },
  "DISTNAME" => "Benchmark-Lab",
  "LICENSE" => "apache",
  "MIN_PERL_VERSION" => "5.008001",
  "NAME" => "Benchmark::Lab",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Devel::NYTProf" => 0,
    "List::Util" => 0,
    "Time::HiRes" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "ExtUtils::MakeMaker" => 0,
    "File::Spec" => 0,
    "Test::More" => 0
  },
  "VERSION" => "0.002",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "Carp" => 0,
  "Devel::NYTProf" => 0,
  "ExtUtils::MakeMaker" => 0,
  "File::Spec" => 0,
  "List::Util" => 0,
  "Test::More" => 0,
  "Time::HiRes" => 0,
  "strict" => 0,
  "warnings" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);
