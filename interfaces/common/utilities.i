////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  Project:  Embedded Machine Learning Library (EMLL)
//  File:     utilities.i (interfaces)
//  Authors:  Chuck Jacobs
//
////////////////////////////////////////////////////////////////////////////////////////////////////

%include "stl.i"

%ignore utilities::operator<<;
%ignore utilities::MakeAnyIterator;
%ignore utilities::IteratorWrapper;

%{
#define SWIG_FILE_WITH_INIT
#include "AnyIterator.h"
#include "RandomEngines.h"
#include "StlIterator.h"
#include "ObjectArchive.h"
#include "IArchivable.h"
#include "Archiver.h"
#include "UniqueId.h"
#include "Variant.h"

#include "LogLoss.h"
#include "HingeLoss.h"
#include "SquaredLoss.h"
#include "LinearPredictor.h"
#include "SGDIncrementalTrainer.h"
%}

template <typename IteratorType, typename ValueType> class StlIterator {};

%import "UniqueId.h"
%import "ObjectArchive.h"
%import "Archiver.h"

%include "AnyIterator.h"
%include "RandomEngines.h"
%include "RowDataset.h"

%include "SGDIncrementalTrainer_wrap.h"

%include "IArchivable.h"
%include "UniqueId.h"
%include "Variant.h"

WRAP_OSTREAM_OUT_TO_STR(utilities::UniqueId)

// This is necessary for us to avoid leaking memory:
#ifndef SWIGXML
%template () std::vector<dataset::GenericSupervisedExample>;
%template () utilities::StlIterator<typename std::vector<dataset::GenericSupervisedExample>::const_iterator, dataset::GenericSupervisedExample>;
#endif

%include "LogLoss.h"
%include "HingeLoss.h"
%include "SquaredLoss.h"

%template () trainers::SGDIncrementalTrainer<lossFunctions::LogLoss>;
%template () trainers::SGDIncrementalTrainer<lossFunctions::HingeLoss>;
%template () trainers::SGDIncrementalTrainer<lossFunctions::SquaredLoss>;

typedef predictors::LinearPredictor trainers::SGDIncrementalTrainer<lossFunctions::SquaredLoss>::Predictor;

// TODO: wrap print