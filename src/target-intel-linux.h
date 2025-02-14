#ifndef __TARGET_INTEL_LINUX_H__
#define __TARGET_INTEL_LINUX_H__
#include "target.h"
#include <iostream>
#include "target-intel-registers.h"
#include "target-intel-instructions.h"
#include "enums.h"
#include <stack>
#include <map>
#include <memory>

class TargetIntelLinux: public Target {
    protected:       
        void variable_declarations(TargetContext & target_context, std::ostream & out);
    public:
        virtual bool write(std::ostream & out, const std::vector<std::unique_ptr<Token>> & tokens) override;

};
#endif // __TARGET_INTEL_LINUX_H__