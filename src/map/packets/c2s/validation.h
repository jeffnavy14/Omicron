/*
===========================================================================

  Copyright (c) 2025 LandSandBoat Dev Teams

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see http://www.gnu.org/licenses/

===========================================================================
*/

#pragma once

class PacketValidationResult
{
public:
    PacketValidationResult()
    : m_Valid(true)
    {
    }

    void addError(const std::string& error)
    {
        m_Errors.push_back(error);
        setValid(false);
    }

    bool valid() const
    {
        return m_Valid;
    }

    void setValid(const bool valid)
    {
        m_Valid = valid;
    }

    std::string errorString() const
    {
        std::string errorMessages;
        for (const auto& error : m_Errors)
        {
            if (!errorMessages.empty())
            {
                errorMessages += ", ";
            }

            errorMessages += error;
        }

        return errorMessages;
    }

private:
    bool                     m_Valid;
    std::vector<std::string> m_Errors;
};

class PacketValidator
{
public:
    PacketValidator() = default;

    // Left value must equal right value
    template <typename T1, typename T2>
    PacketValidator& mustEqual(T1 left, T2 right, const std::string& errMsg)
    {
        const auto rightVal = static_cast<T1>(right);
        if (left != rightVal)
        {
            result_.addError(errMsg);
        }

        return *this;
    }

    // Left value must not equal right value
    template <typename T1, typename T2>
    PacketValidator& mustNotEqual(T1 left, T2 right, const std::string& errMsg)
    {
        const auto rightVal = static_cast<T1>(right);
        if (left == rightVal)
        {
            result_.addError(errMsg);
        }

        return *this;
    }

    // Inclusive range check
    template <typename T, typename MinT, typename MaxT>
    PacketValidator& range(const std::string& fieldName, T value, MinT min, MaxT max)
    {
        const auto val    = value;
        const auto minVal = static_cast<T>(min);
        const auto maxVal = static_cast<T>(max);

        if (val < minVal || val > maxVal)
        {
            result_.addError(std::format("{} out of range: {} not in [{}, {}]",
                                         fieldName, val, minVal, maxVal));
        }

        return *this;
    }

    // Value must be a multiple of divisor
    template <typename T, typename DivT>
    PacketValidator& multipleOf(const std::string& fieldName, T value, DivT divisor)
    {
        const auto divVal = static_cast<T>(divisor);
        if (value % divVal != 0)
        {
            result_.addError(std::format("{} is not a multiple of {}.", fieldName, divVal));
        }

        return *this;
    }

    // Custom validation function
    template <typename Func>
    PacketValidator& custom(Func customValidation)
    {
        customValidation(*this);
        return *this;
    }

    operator PacketValidationResult() &&
    {
        return std::move(result_);
    }

    operator PacketValidationResult() const&
    {
        return result_;
    }

private:
    PacketValidationResult result_;
};
